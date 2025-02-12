-- Conflicts with wool:slab_red 6
if minetest.get_modpath("xdecor") and minetest.get_modpath("wool") then
	minetest.clear_craft({
		output = "xdecor:cushion 3"
	})
	minetest.register_craft({
		output = "xdecor:cushion 3",
		recipe = {
			{"wool:red", "wool:red", "wool:red"},
			{"", "default:wood", ""},
			{"", "", ""}
		}
	})
end

-- Conflicts with cottages:glass_pane 4
if minetest.get_modpath("xdecor") and minetest.get_modpath("cottages") then
	minetest.clear_craft({
		output = "xdecor:woodframed_glass"
	})
	minetest.register_craft({
		output = "xdecor:woodframed_glass",
		recipe = {
			{"group:wood", "group:stick", "group:wood"},
			{"group:stick", "default:glass", "group:stick"},
			{"group:wood", "group:stick", "group:wood"}
		}
	})
end

if minetest.get_modpath("mobs_monster") and minetest.get_modpath("homedecor_cobweb") then
	minetest.clear_craft({
		output = "homedecor:cobweb_corner"
	})
	minetest.register_craft({
		type = "shapeless",
		output = "homedecor:cobweb_corner",
		recipe = {"mobs:cobweb"}
	})
end

if minetest.get_modpath("mobs_monster") and minetest.get_modpath("xdecor") then
	minetest.clear_craft({
		output = "xdecor:cobweb"
	})
	minetest.register_craft({
		type = "shapeless",
		output = "xdecor:cobweb",
		recipe = {"mobs:cobweb"}
	})
end

if minetest.get_modpath("homedecor_misc") and minetest.get_modpath("xdecor") then
	minetest.clear_craft({
		output = "xdecor:tatami"
	})
	minetest.register_craft({
		type = "shapeless",
		output = "xdecor:tatami",
		recipe = {"homedecor:tatami_mat"}
	})
end

if minetest.get_modpath("doors") and minetest.get_modpath("xpanes") then
	minetest.clear_craft({
		output = "xpanes:door_steel_bar"
	})
	minetest.register_craft({
		type = "shapeless",
		output = "xpanes:door_steel_bar",
		recipe = {"doors:prison_door"}
	})
end

if minetest.get_modpath("farming") and minetest.get_modpath("xdecor") then
	minetest.clear_craft({
		output = "xdecor:bowl 3"
	})
	minetest.register_craft({
		type = "shapeless",
		output = "xdecor:bowl",
		recipe = {"farming:bowl"}
	})
end