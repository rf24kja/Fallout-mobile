import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'/'art'))
from asset_uniqueness_guard import slug, evaluate, audit_catalog, _image_hashes, load_catalog


class TestAssetGuard(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.catalog = {'objects': [
            {'id':'pump_shotgun', 'wave':'wave01', 'ref':'master', 'variants':[{'path':'old.png','sha256':'abc'}]},
            {'id':'retro_crt_terminal', 'wave':'wave12','ref':'wave12','variants':[{'path':'crt.png','sha256':'def'}]},
            {'id':'survivor_backpack', 'wave':'wave03','ref':'master','variants':[{'path':'pack.png','sha256':'ghi'}]},
        ], 'families': [
            {'key':'shotgun_pump','aliases':['pump_shotgun','combat_shotgun']},
            {'key':'crt_terminal','aliases':['retro_crt_terminal','crt_terminal']},
        ]}

    def test_slug(self):
        self.assertEqual(slug('weapons/Combat-Shotgun_256.PNG'), 'combat_shotgun')

    def test_exact_name_rejected(self):
        self.assertEqual(evaluate(self.catalog,'pump_shotgun',None,Path('.'))['status'],
                         'REJECT_DUPLICATE_ID_OR_CONTENT')

    def test_related_name_requires_review(self):
        self.assertEqual(evaluate(self.catalog,'combat_shotgun',None,Path('.'))['status'],
                         'REVIEW_EXISTING_VARIANT_BEFORE_NEW_OBJECT')

    def test_new_name_is_provisional_without_image(self):
        self.assertEqual(evaluate(self.catalog,'mechanical_egg_timer',None,Path('.'))['status'],
                         'NAME_ONLY_PROVISIONAL')

    def test_audit_reports_related(self):
        c=dict(self.catalog)
        c['objects']=self.catalog['objects']+[{'id':'combat_shotgun','wave':'wave14','ref':'other',
                                              'variants':[{'path':'new.png','sha256':'hhh'}]}]
        self.assertIn('shotgun_pump',audit_catalog(c)['related_subject_families'])

    def test_visual_clone(self):
        from PIL import Image, ImageDraw
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory)
            src=Image.new('RGBA',(90,90),(0,0,0,0))
            d=ImageDraw.Draw(src)
            d.polygon([(12,8),(78,22),(45,78)],fill=(140,70,35,255))
            src.save(root/'old.png')
            src.resize((128,128)).save(root/'new.png')
            r=evaluate(self.catalog,'unrelated_new_id',root/'new.png',root)
            self.assertTrue(r['visual_similarity_review'])
            self.assertEqual(r['status'],'REVIEW_EXISTING_VARIANT_BEFORE_NEW_OBJECT')


if __name__ == '__main__':
    unittest.main()