minetest.register_node("life_crystal:crystal", {
	description = "Life Crystal(grows plants)",
	drawtype = "plantlike",
	tiles = {"lifecrystal.png"},
	inventory_image = "lifecrystal.png",
	wield_image = "lifecrystal.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {water = 3, liquid = 3, dig_immediate = 3, attached_node = 1, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
	light_source = 2,
	sunlight_propagates = true,
})


minetest.register_node("life_crystal:bright_crystal", {
	description = "Bright Life Crystal(grows plants)",
	drawtype = "plantlike",
	tiles = {"lifecrystal2.png"},
	inventory_image = "lifecrystal2.png",
	wield_image = "lifecrystal2.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {water = 3, liquid = 3, dig_immediate = 3, attached_node = 1, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
	light_source = 14,
	sunlight_propagates = true,
})


--crafting crystal
minetest.register_craft({
	output = 'life_crystal:crystal 4',
	recipe = {
		{'default:glass', 'bucket:bucket_water', 'default:glass'},
		{'default:dirt', 'group:sapling', 'default:dirt'},
		{'default:glass', 'default:dirt', 'default:glass'},    
	},
    replacements = {
	        {"bucket:bucket_water", "bucket:bucket_empty"},
    }
})

--crafting crystal
minetest.register_craft({
    type = "shapeless",
	output = 'life_crystal:bright_crystal',
	recipe = {'default:diamond','life_crystal:crystal'},
})
