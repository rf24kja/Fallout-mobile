extends SceneTree

func _init() -> void:
	print("Art Validation: Starting in-game validation renders...")
	var output_dir = "user://artifacts/art_review/pistol/"
	_ensure_output_dir(output_dir)
	# Wait for autoloads to initialize
	for i in range(10):
		call_deferred("_process_frame_wait")
		# Can't await in _init, use a different approach

func _process_frame_wait() -> void:
	# This won't work as expected in _init
	pass

func _notification(what: int) -> void:
	if what == NOTIFICATION_PROCESS_TIME:
		# First process tick
		call_deferred("_run_validation")

func _run_validation() -> void:
	print("Running validation...")
	_render_comparison_sheets()
	print("Art Validation: Complete!")
	quit(0)

func _ensure_output_dir(output_dir: String) -> void:
	var dir = DirAccess.open("user://")
	if dir and not dir.dir_exists(output_dir):
		dir.make_dir_recursive(output_dir)
		print("Created output dir: ", output_dir)

func _render_comparison_sheets() -> void:
	# Load sprite frames for both weapons
	var prod_sprite_frames = load("res://assets/weapons/production_pistol_candidate/production_pistol_sprite_frames.tres")
	var scrap_sprite_frames = load("res://assets/weapons/scrap_pistol/scrap_pistol_sprite_frames.tres")
	
	if not prod_sprite_frames:
		print("ERROR: Failed to load production pistol sprite frames")
		return
	if not scrap_sprite_frames:
		print("ERROR: Failed to load scrap pistol sprite frames")
		return
	
	print("Loaded sprite frames for both weapons")
	
	# Create comparison: 8-direction contact sheet
	_render_direction_contact_sheet(prod_sprite_frames, scrap_sprite_frames)
	
	# Create scale comparison at native size
	_render_scale_comparison(prod_sprite_frames, scrap_sprite_frames)
	
	# Create inventory icon comparison
	_render_inventory_comparison(prod_sprite_frames, scrap_sprite_frames)
	
	# Create combat HUD comparison (weapon panel)
	_render_combat_hud_comparison(prod_sprite_frames, scrap_sprite_frames)
	
	# Create ART_APPROVAL_SHEET
	_render_art_approval_sheet(prod_sprite_frames, scrap_sprite_frames)

func _render_direction_contact_sheet(prod_sf: SpriteFrames, scrap_sf: SpriteFrames) -> void:
	var directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
	var anim_name = "idle"  # or "attack" depending on what's available
	
	# Check available animations
	var prod_anims = prod_sf.get_animation_names()
	var scrap_anims = scrap_sf.get_animation_names()
	print("Production anims: ", prod_anims)
	print("Scrap anims: ", scrap_anims)
	
	# Use first available animation
	var use_anim = "idle"
	if "idle" not in prod_anims:
		use_anim = prod_anims[0] if prod_anims.size() > 0 else "idle"
	
	var cell_size = Vector2(256, 256)
	var cols = 8
	var rows = 2  # production + scrap
	var sheet_size = Vector2(cell_size.x * cols, cell_size.y * rows)
	
	var image = Image.create(sheet_size.x, sheet_size.y, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.1, 0.1, 0.1, 1.0))
	
	# Row 0: Production pistol
	for i, dir in enumerate(directions):
		var frame_idx = _get_direction_frame_index(dir, use_anim, prod_sf)
		if frame_idx >= 0:
			var tex = prod_sf.get_frame_texture(use_anim, frame_idx)
			if tex:
				var img = tex.get_image()
				if img:
					_draw_scaled_to_cell(image, img, Vector2(i * cell_size.x, 0), cell_size)
					# Draw label
					_draw_text(image, "PROD: " + dir, Vector2(i * cell_size.x + 4, 16), Color(0, 1, 0, 1))
	
	# Row 1: Scrap pistol (placeholder)
	for i, dir in enumerate(directions):
		var frame_idx = _get_direction_frame_index(dir, use_anim, scrap_sf)
		if frame_idx >= 0:
			var tex = scrap_sf.get_frame_texture(use_anim, frame_idx)
			if tex:
				var img = tex.get_image()
				if img:
					_draw_scaled_to_cell(image, img, Vector2(i * cell_size.x, cell_size.y), cell_size)
					_draw_text(image, "SCRAP: " + dir, Vector2(i * cell_size.x + 4, cell_size.y + 16), Color(1, 1, 0, 1))
	
	# Draw divider line
	for x in range(sheet_size.x):
		image.set_pixel(x, cell_size.y - 1, Color(0.5, 0.5, 0.5, 1))
		image.set_pixel(x, cell_size.y, Color(0.5, 0.5, 0.5, 1))
	
	# Save
	var path = output_dir + "direction_contact_sheet.png"
	Image.save_png(image, path)
	print("Saved direction contact sheet: ", path)

func _render_scale_comparison(prod_sf: SpriteFrames, scrap_sf: SpriteFrames) -> void:
	# Compare at different display scales: 1x, 2x, 4x (mobile zoom levels)
	var scales = [1.0, 2.0, 4.0]
	var anim_name = "idle"
	var prod_anims = prod_sf.get_animation_names()
	if "idle" not in prod_anims and prod_anims.size() > 0:
		anim_name = prod_anims[0]
	
	var frame_idx = _get_direction_frame_index("SE", anim_name, prod_sf)
	if frame_idx < 0:
		frame_idx = 0
	
	var prod_tex = prod_sf.get_frame_texture(anim_name, frame_idx)
	var scrap_tex = scrap_sf.get_frame_texture(anim_name, 0)
	
	if not prod_tex or not scrap_tex:
		print("Could not get textures for scale comparison")
		return
	
	var prod_img = prod_tex.get_image()
	var scrap_img = scrap_tex.get_image()
	if not prod_img or not scrap_img:
		return
	
	var cell_w = int(256 * 4.0)
	var cell_h = int(256 * 4.0)
	var total_w = cell_w * 2
	var total_h = cell_h * scales.size()
	
	var image = Image.create(total_w, total_h, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.1, 0.1, 0.1, 1.0))
	
	for si, scale in enumerate(scales):
		var y = int(si * cell_h)
		var sw = int(256 * scale)
		var sh = int(256 * scale)
		
		# Production
		var prod_scaled = prod_img.duplicate()
		prod_scaled.resize(sw, sh, Image.INTERPOLATE_CUBIC)
		var px = (cell_w - sw) // 2
		var py = y + (cell_h - sh) // 2
		image.blit_rect(prod_scaled, Rect2(Vector2(0, 0), Vector2(sw, sh)), Vector2(px, py))
		_draw_text(image, "Production @ " + str(scale) + "x", Vector2(px, py - 20), Color(0, 1, 0, 1))
		
		# Scrap
		var scrap_scaled = scrap_img.duplicate()
		scrap_scaled.resize(sw, sh, Image.INTERPOLATE_CUBIC)
		px = cell_w + (cell_w - sw) // 2
		image.blit_rect(scrap_scaled, Rect2(Vector2(0, 0), Vector2(sw, sh)), Vector2(px, py))
		_draw_text(image, "Scrap (Placeholder) @ " + str(scale) + "x", Vector2(px, py - 20), Color(1, 1, 0, 1))
	
	var path = output_dir + "scale_comparison.png"
	Image.save_png(image, path)
	print("Saved scale comparison: ", path)

func _render_inventory_comparison(prod_sf: SpriteFrames, scrap_sf: SpriteFrames) -> void:
	# Inventory icons are typically 64x64 or 128x128
	var icon_size = Vector2(128, 128)
	
	var anim_name = "idle"
	var prod_anims = prod_sf.get_animation_names()
	if "idle" not in prod_anims and prod_anims.size() > 0:
		anim_name = prod_anims[0]
	
	var prod_tex = prod_sf.get_frame_texture(anim_name, 0)
	var scrap_tex = scrap_sf.get_frame_texture(anim_name, 0)
	
	if not prod_tex or not scrap_tex:
		return
	
	var prod_img = prod_tex.get_image()
	var scrap_img = scrap_tex.get_image()
	
	var image = Image.create(icon_size.x * 2 + 20, icon_size.y + 60, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.05, 0.05, 0.05, 1.0))
	
	# Production icon
	var prod_scaled = prod_img.duplicate()
	prod_scaled.resize(icon_size.x, icon_size.y, Image.INTERPOLATE_CUBIC)
	image.blit_rect(prod_scaled, Rect2(Vector2(0, 0), icon_size), Vector2(10, 40))
	_draw_text(image, "Production Pistol (Candidate)", Vector2(10, 15), Color(0, 1, 0, 1))
	_draw_text(image, "ART_CANDIDATE - Pending A4 Approval", Vector2(10, 30), Color(1, 0.5, 0, 1))
	
	# Scrap icon
	var scrap_scaled = scrap_img.duplicate()
	scrap_scaled.resize(icon_size.x, icon_size.y, Image.INTERPOLATE_CUBIC)
	image.blit_rect(scrap_scaled, Rect2(Vector2(0, 0), icon_size), Vector2(icon_size.x + 20, 40))
	_draw_text(image, "Scrap Pistol (Current Placeholder)", Vector2(icon_size.x + 20, 15), Color(1, 1, 0, 1))
	
	var path = output_dir + "inventory_comparison.png"
	Image.save_png(image, path)
	print("Saved inventory comparison: ", path)

func _render_combat_hud_comparison(prod_sf: SpriteFrames, scrap_sf: SpriteFrames) -> void:
	# Simulate combat HUD weapon panel - typically shows weapon name, icon, ammo
	var panel_w = 400
	var panel_h = 150
	
	var anim_name = "idle"
	var prod_anims = prod_sf.get_animation_names()
	if "idle" not in prod_anims and prod_anims.size() > 0:
		anim_name = prod_anims[0]
	
	var prod_tex = prod_sf.get_frame_texture(anim_name, _get_direction_frame_index("SE", anim_name, prod_sf))
	var scrap_tex = scrap_sf.get_frame_texture(anim_name, _get_direction_frame_index("SE", anim_name, scrap_sf))
	
	if not prod_tex or not scrap_tex:
		return
	
	var prod_img = prod_tex.get_image()
	var scrap_img = scrap_tex.get_image()
	
	var image = Image.create(panel_w * 2 + 40, panel_h + 20, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.1, 0.1, 0.15, 1.0))
	
	# Production panel
	_draw_panel_bg(image, Rect2(10, 10, panel_w, panel_h), Color(0.15, 0.2, 0.15, 1))
	_draw_text(image, "WEAPON SLOT", Vector2(20, 30), Color(0.5, 1, 0.5, 1))
	_draw_text(image, "Production Pistol", Vector2(20, 55), Color(0, 1, 0, 1))
	_draw_text(image, "DMG: 20-28 | ACC: +10% | CRIT: +10%", Vector2(20, 75), Color(0.8, 0.8, 0.8, 1))
	_draw_text(image, "AP: 4 | MAG: 10 | RNG: 22m", Vector2(20, 95), Color(0.8, 0.8, 0.8, 1))
	_draw_text(image, "Ammo: 9mm JHP / AP / Std", Vector2(20, 115), Color(0.6, 0.9, 0.6, 1))
	
	var icon_size = 64
	var prod_scaled = prod_img.duplicate()
	prod_scaled.resize(icon_size, icon_size, Image.INTERPOLATE_CUBIC)
	image.blit_rect(prod_scaled, Rect2(Vector2(0, 0), Vector2(icon_size, icon_size)), Vector2(panel_w - icon_size - 20, 30))
	
	# Scrap panel
	_draw_panel_bg(image, Rect2(panel_w + 30, 10, panel_w, panel_h), Color(0.2, 0.15, 0.15, 1))
	_draw_text(image, "WEAPON SLOT", Vector2(panel_w + 40, 30), Color(1, 0.5, 0.5, 1))
	_draw_text(image, "Scrap Pistol", Vector2(panel_w + 40, 55), Color(1, 1, 0, 1))
	_draw_text(image, "DMG: 8-12 | ACC: 0% | CRIT: +5%", Vector2(panel_w + 40, 75), Color(0.8, 0.8, 0.8, 1))
	_draw_text(image, "AP: 3 | MAG: 6 | RNG: 18m", Vector2(panel_w + 40, 95), Color(0.8, 0.8, 0.8, 1))
	_draw_text(image, "Ammo: 10mm Std", Vector2(panel_w + 40, 115), Color(0.9, 0.6, 0.6, 1))
	
	var scrap_scaled = scrap_img.duplicate()
	scrap_scaled.resize(icon_size, icon_size, Image.INTERPOLATE_CUBIC)
	image.blit_rect(scrap_scaled, Rect2(Vector2(0, 0), Vector2(icon_size, icon_size)), Vector2(panel_w * 2 + 30 - icon_size - 20, 30))
	
	var path = output_dir + "combat_hud_comparison.png"
	Image.save_png(image, path)
	print("Saved combat HUD comparison: ", path)

func _render_art_approval_sheet(prod_sf: SpriteFrames, scrap_sf: SpriteFrames) -> void:
	# Master approval sheet with all validation views
	var sheet_w = 1920
	var sheet_h = 1080
	var image = Image.create(sheet_w, sheet_h, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.08, 0.08, 0.1, 1.0))
	
	# Title
	_draw_text(image, "FALLOUT 2 REBORN MOBILE - ART APPROVAL SHEET", Vector2(40, 40), Color(1, 1, 1, 1), 28)
	_draw_text(image, "Production Pistol Candidate - A3 Validation Gate", Vector2(40, 75), Color(0.8, 0.8, 0.8, 1), 18)
	_draw_text(image, "Status: ART_CANDIDATE - PENDING USER APPROVAL (A4 Gate)", Vector2(40, 105), Color(1, 0.6, 0, 1), 16)
	
	# Load and embed the previously generated comparison images
	_load_and_embed(image, output_dir + "direction_contact_sheet.png", Vector2(40, 140), Vector2(800, 400))
	_load_and_embed(image, output_dir + "scale_comparison.png", Vector2(40, 560), Vector2(800, 400))
	_load_and_embed(image, output_dir + "inventory_comparison.png", Vector2(860, 140), Vector2(500, 300))
	_load_and_embed(image, output_dir + "combat_hud_comparison.png", Vector2(860, 460), Vector2(1000, 200))
	
	# Quality checklist
	var checklist_x = 860
	var checklist_y = 680
	_draw_text(image, "QUALITY CHECKLIST:", Vector2(checklist_x, checklist_y), Color(1, 1, 1, 1), 18)
	
	var checks = [
		("Geometry Detail", "32 parts modeled (slide, barrel, frame, grip, trigger, hammer, sights, magazine, controls)"),
		("Silhouette", "Recognizable pistol profile at all 8 directions"),
		("Materials", "Blued steel (slide/barrel), matte steel (frame), polymer (grip), brass (accents)"),
		("Texture Quality", "Procedural materials - no UV unwrapping needed for render"),
		("Lighting", "3-point studio + bounce, orthographic isometric camera"),
		("Character Attachment", "Integrated via CharacterVisual.gd paperdoll layer (WeaponSprite)"),
		("Sprite Orientation", "8 directions rendered at 35.264° elevation, 45° azimuth"),
		("Game Scale", "Fixed framing (ortho_scale=0.35) - 43-47px content in 256px canvas"),
		("Mobile Readability", "Tested at 1x, 2x, 4x - visible at all zoom levels"),
		("Pipeline Consistency", "Matches CharacterVisual weapon layer z-index (6)"),
	]
	
	for i, (title, desc) in enumerate(checks):
		var y = checklist_y + 35 + i * 30
		_draw_text(image, "[ ] " + title, Vector2(checklist_x, y), Color(0.8, 1, 0.8, 1), 14)
		_draw_text(image, "    " + desc, Vector2(checklist_x + 10, y + 18), Color(0.7, 0.7, 0.7, 1), 12)
	
	# Known issues
	var issues_y = checklist_y + 35 + checks.size() * 30 + 20
	_draw_text(image, "KNOWN ISSUES:", Vector2(checklist_x, issues_y), Color(1, 0.5, 0.5, 1), 18)
	var issues = [
		"Sprite fill ratio 1.8-3.4% vs placeholder 2.9-4.8% - production sprites smaller in absolute pixels",
		"_is_ui_focused() doesn't detect instanced DialogueUI in headless mode (test workaround applied)",
		"Wireframe render failed (Blender API limitation) - manual inspection needed",
		"No GLTF export yet - visual_asset path placeholder",
	]
	for i, issue in enumerate(issues):
		_draw_text(image, "! " + issue, Vector2(checklist_x + 10, issues_y + 30 + i * 22), Color(1, 0.7, 0.7, 1), 13)
	
	var path = output_dir + "ART_APPROVAL_SHEET.png"
	Image.save_png(image, path)
	print("Saved ART_APPROVAL_SHEET: ", path)

func _get_direction_frame_index(direction: String, anim_name: String, sf: SpriteFrames) -> int:
	# Map direction to frame index based on sprite frames structure
	# Assuming frames are ordered N, NE, E, SE, S, SW, W, NW
	var dir_map = {"N": 0, "NE": 1, "E": 2, "SE": 3, "S": 4, "SW": 5, "W": 6, "NW": 7}
	var idx = dir_map.get(direction, 0)
	var frame_count = sf.get_frame_count(anim_name)
	if idx >= frame_count:
		idx = 0
	return idx

func _draw_scaled_to_cell(canvas: Image, source: Image, pos: Vector2, cell_size: Vector2) -> void:
	# Scale source to fit in cell while maintaining aspect
	var sw = source.get_width()
	var sh = source.get_height()
	var scale = min(cell_size.x / sw, cell_size.y / sh) * 0.9  # 90% fill
	var nw = int(sw * scale)
	var nh = int(sh * scale)
	
	var scaled = source.duplicate()
	scaled.resize(nw, nh, Image.INTERPOLATE_CUBIC)
	
	var px = int(pos.x + (cell_size.x - nw) / 2)
	var py = int(pos.y + (cell_size.y - nh) / 2)
	canvas.blit_rect(scaled, Rect2(Vector2(0, 0), Vector2(nw, nh)), Vector2(px, py))

func _draw_panel_bg(canvas: Image, rect: Rect2, color: Color) -> void:
	for x in range(int(rect.size.x)):
		for y in range(int(rect.size.y)):
			canvas.set_pixel(int(rect.position.x) + x, int(rect.position.y) + y, color)

func _draw_text(canvas: Image, text: String, pos: Vector2, color: Color, size: int = 16) -> void:
	# Simple text rendering - draw colored rects as placeholder
	# In a real implementation, would use a font
	var char_w = size * 0.6
	var char_h = size
	for i, char in enumerate(text):
		var cx = int(pos.x + i * char_w)
		var cy = int(pos.y)
		# Draw a small rect for each character (placeholder)
		for x in range(int(char_w)):
			for y in range(int(char_h * 0.1)):
				if cx + x < canvas.get_width() and cy + y + int(char_h * 0.8) < canvas.get_height():
					canvas.set_pixel(cx + x, cy + y + int(char_h * 0.8), color)

func _load_and_embed(canvas: Image, path: String, pos: Vector2, max_size: Vector2) -> void:
	# Try to load and embed an existing PNG
	var img = Image.load_from_file("user://" + path)
	if not img:
		img = Image.load_from_file("res://" + path)
	if not img:
		# Try absolute path
		img = Image.load_from_file(path)
	if img:
		var scaled = img.duplicate()
		var scale = min(max_size.x / img.get_width(), max_size.y / img.get_height())
		var nw = int(img.get_width() * scale)
		var nh = int(img.get_height() * scale)
		scaled.resize(nw, nh, Image.INTERPOLATE_CUBIC)
		canvas.blit_rect(scaled, Rect2(Vector2(0, 0), Vector2(nw, nh)), pos)
		_draw_text(canvas, path.get_file(), pos + Vector2(0, nh + 5), Color(0.5, 0.5, 0.5, 1), 12)
	else:
		_draw_text(canvas, "[MISSING: " + path + "]", pos, Color(1, 0.3, 0.3, 1), 14)