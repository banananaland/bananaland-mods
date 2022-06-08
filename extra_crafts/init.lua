--[[minetest.register_craft({
	type = "shapeless",
	output = "xdecor:bowl_soup",
	recipe = {"flowers:mushroom_red", "bucket:bucket_water","xdecor:bowl","flowers:mushroom_red","flowers:mushroom_red","flowers:mushroom_brown"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})]]

minetest.register_craft({
	type = "shapeless",
	output = "moreblocks:stone_tile 2",
	recipe = {"xdecor:stone_tile"},

})

minetest.register_craft({

	output = "xdecor:cushion 3",
	recipe = {
		{"wool:red","wool:red","wool:red"},
		{"","default:wood",""},
		{"","",""}
	},

})

minetest.register_craft({
	output = "xdecor:woodframed_glass 3",
	recipe = {
		{"group:stick", "default:glass", "group:stick"},
		{"group:stick", "default:glass", "group:stick"},
		{"group:stick", "default:glass", "group:stick"}
	}
})

--[[minetest.register_craft({
	output = "cottages:glass_pane 12",
	recipe = {
		{"group:stick", "default:glass", "group:stick"},
		{"", "default:glass", ""},
		{"group:stick", "default:glass", "group:stick"}
	}
})]]

--[[minetest.register_craft({
	output = "darkage:dry_leaves",
	type = "cooking",
	recipe = "default:leaves",
	cooktime = 12
})]]

minetest.register_craft({
	type = "shapeless",
	output = "moreblocks:circle_stone_bricks",
	recipe = {"xdecor:stone_rune"},
})
--[[
minetest.register_craftitem(":xdecor:bowl_soup", {
	description = "Red Mushroom Soup Bowl",
	inventory_image = "xdecor_bowl_soup.png",
	wield_image = "xdecor_bowl_soup.png",
	--groups = {not_in_creative_inventory=1},
	stack_max = 1,
	on_use = function(itemstack, user)
		itemstack:replace("xdecor:bowl 1")
		if minetest.get_modpath("hunger") then
			minetest.item_eat(20)
		else
			user:set_hp(20)
		end
		return itemstack
	end
})]]

minetest.register_node(":default:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 9999,
})

minetest.register_node(":default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
    stack_max = 9999,
})


minetest.register_node(":default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
	stack_max = 9999,
})

stairsplus:register_all("xdecor", "moonbrick", "xdecor:moonbrick", {
description = "moonbrick",
tiles = {"xdecor_moonbrick.png","xdecor_moonbrick.png","xdecor_moonbrick.png"},
groups = {cracky=2},
sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("xdecor", "cactusbrick", "xdecor:cactusbrick", {
description = "cactusbrick",
tiles = {"xdecor_cactusbrick.png","xdecor_cactusbrick.png","xdecor_cactusbrick.png"},
groups = {cracky=2},
sounds = default.node_sound_stone_defaults(),
})
