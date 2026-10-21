#!/usr/bin/env python3
"""Atlas Builder for Fallout 2 Reborn Mobile.

Packs individual PNG tiles into 2048x2048 texture atlases and generates
Godot TextureAtlas (.tres) metadata files.

Usage:
    python atlas_builder.py --input tiles/ --output atlases/ --tile-size 128
"""

import argparse
import os
import json
from pathlib import Path
from PIL import Image
import sys

# Default configuration
DEFAULT_TILE_SIZE = 128
DEFAULT_ATLAS_SIZE = 2048
DEFAULT_PADDING = 2

class AtlasBuilder:
    def __init__(self, tile_size=DEFAULT_TILE_SIZE, atlas_size=DEFAULT_ATLAS_SIZE, padding=DEFAULT_PADDING):
        self.tile_size = tile_size
        self.atlas_size = atlas_size
        self.padding = padding
        self.tiles_per_row = atlas_size // (tile_size + padding)
        self.max_tiles = self.tiles_per_row * self.tiles_per_row
        
    def load_tiles(self, input_dir):
        """Load all PNG tiles from input directory."""
        tiles = []
        input_path = Path(input_dir)
        
        for png_file in sorted(input_path.glob("*.png")):
            try:
                img = Image.open(png_file)
                # Ensure correct size
                if img.size != (self.tile_size, self.tile_size):
                    print(f"Warning: {png_file.name} is {img.size}, expected {self.tile_size}x{self.tile_size}. Resizing...")
                    img = img.resize((self.tile_size, self.tile_size), Image.LANCZOS)
                
                # Ensure RGBA
                if img.mode != 'RGBA':
                    img = img.convert('RGBA')
                
                tiles.append({
                    'name': png_file.stem,
                    'image': img,
                    'path': png_file
                })
                print(f"Loaded: {png_file.name} ({img.size})")
            except Exception as e:
                print(f"Error loading {png_file}: {e}")
        
        return tiles
    
    def pack_atlas(self, tiles, atlas_index=0):
        """Pack tiles into a single atlas image."""
        atlas = Image.new('RGBA', (self.atlas_size, self.atlas_size), (0, 0, 0, 0))
        regions = []
        
        for i, tile in enumerate(tiles):
            row = i // self.tiles_per_row
            col = i % self.tiles_per_row
            
            x = col * (self.tile_size + self.padding)
            y = row * (self.tile_size + self.padding)
            
            atlas.paste(tile['image'], (x, y))
            
            # Godot uses UV coordinates (0-1)
            u1 = x / self.atlas_size
            v1 = y / self.atlas_size
            u2 = (x + self.tile_size) / self.atlas_size
            v2 = (y + self.tile_size) / self.atlas_size
            
            regions.append({
                'name': tile['name'],
                'region': [u1, v1, u2, v2],
                'pixel_region': [x, y, self.tile_size, self.tile_size],
                'atlas_index': atlas_index
            })
        
        return atlas, regions
    
    def build(self, input_dir, output_dir):
        """Build atlases from input tiles."""
        os.makedirs(output_dir, exist_ok=True)
        
        tiles = self.load_tiles(input_dir)
        if not tiles:
            print("No tiles found!")
            return
        
        print(f"\nLoaded {len(tiles)} tiles")
        print(f"Atlas capacity: {self.max_tiles} tiles per atlas ({self.tiles_per_row}x{self.tiles_per_row})")
        
        all_regions = []
        atlas_count = 0
        
        # Split tiles into atlas chunks
        for i in range(0, len(tiles), self.max_tiles):
            chunk = tiles[i:i + self.max_tiles]
            atlas_img, regions = self.pack_atlas(chunk, atlas_count)
            
            # Save atlas image
            atlas_name = f"atlas_{atlas_count:03d}.png"
            atlas_path = Path(output_dir) / atlas_name
            atlas_img.save(atlas_path)
            print(f"Saved atlas: {atlas_name} ({len(chunk)} tiles)")
            
            all_regions.extend(regions)
            atlas_count += 1
        
        # Generate Godot TextureAtlas .tres file
        self.generate_tres(output_dir, all_regions, atlas_count)
        
        # Generate JSON manifest for reference
        self.generate_manifest(output_dir, all_regions, atlas_count)
        
        print(f"\nDone! Created {atlas_count} atlas(es) with {len(all_regions)} total tiles")
        return all_regions
    
    def generate_tres(self, output_dir, regions, atlas_count):
        """Generate Godot TextureAtlas .tres resource file."""
        tres_path = Path(output_dir) / "texture_atlas.tres"
        
        # Build resource content
        lines = [
            '[gd_resource type="TextureAtlas" load_steps=2 format=3 uid="uid://texture_atlas"]',
            '',
            '[sub_resource type="AtlasTexture" id="AtlasTexture_0"]',
            'atlas = ExtResource("1")',
            'region = Rect2(0, 0, 1, 1)',  # placeholder
            ''
        ]
        
        # Add each tile as an AtlasTexture sub-resource
        for i, region in enumerate(regions):
            # UV coordinates in Godot: region = Rect2(x, y, width, height) in pixels
            x, y, w, h = region['pixel_region']
            lines.extend([
                f'[sub_resource type="AtlasTexture" id="AtlasTexture_{i+1}"]',
                f'atlas = ExtResource("{region["atlas_index"] + 1}")',
                f'region = Rect2({x}, {y}, {w}, {h})',
                ''
            ])
        
        # External resources (the atlas images)
        for i in range(atlas_count):
            lines.append(f'[ext_resource path="res://atlases/atlas_{i:03d}.png" type="Texture2D" id={i+1}]')
        
        # Main resource
        lines.extend([
            '[resource]',
            f'tile_size = Vector2i({self.tile_size}, {self.tile_size})',
            'textures = {'
        ])
        
        for i, region in enumerate(regions):
            lines.append(f'    "{region["name"]}": SubResource("AtlasTexture_{i+1}"),')
        
        lines.append('}')
        
        content = '\n'.join(lines)
        tres_path.write_text(content)
        print(f"Generated: {tres_path}")
    
    def generate_manifest(self, output_dir, regions, atlas_count):
        """Generate JSON manifest for reference."""
        manifest = {
            'tile_size': self.tile_size,
            'atlas_size': self.atlas_size,
            'padding': self.padding,
            'tiles_per_row': self.tiles_per_row,
            'atlas_count': atlas_count,
            'tiles': {}
        }
        
        for region in regions:
            manifest['tiles'][region['name']] = {
                'atlas': f"atlas_{region['atlas_index']:03d}.png",
                'region_uv': region['region'],
                'region_px': region['pixel_region']
            }
        
        manifest_path = Path(output_dir) / "atlas_manifest.json"
        manifest_path.write_text(json.dumps(manifest, indent=2))
        print(f"Generated: {manifest_path}")


def main():
    parser = argparse.ArgumentParser(description='Build texture atlases for Godot')
    parser.add_argument('--input', '-i', required=True, help='Input directory with PNG tiles')
    parser.add_argument('--output', '-o', required=True, help='Output directory for atlases')
    parser.add_argument('--tile-size', type=int, default=DEFAULT_TILE_SIZE, help='Tile size in pixels')
    parser.add_argument('--atlas-size', type=int, default=DEFAULT_ATLAS_SIZE, help='Atlas size in pixels')
    parser.add_argument('--padding', type=int, default=DEFAULT_PADDING, help='Padding between tiles')
    
    args = parser.parse_args()
    
    builder = AtlasBuilder(
        tile_size=args.tile_size,
        atlas_size=args.atlas_size,
        padding=args.padding
    )
    
    builder.build(args.input, args.output)


if __name__ == '__main__':
    main()