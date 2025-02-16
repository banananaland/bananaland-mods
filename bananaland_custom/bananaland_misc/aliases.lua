if minetest.get_modpath("building_blocks") and minetest.get_modpath("moreblocks") then -- fix building_blocks aliases
	stairsplus:register_alias_force_all("moreblocks", "tar", "building_blocks", "Tar")
end

if minetest.get_modpath("cottages") then -- for switching cottages to flux's fork
	minetest.register_alias("cottages:feldweg_bamboo", "cottages:feldweg")
	minetest.register_alias("cottages:feldweg_crossing_bamboo", "cottages:feldweg_crossing")
	minetest.register_alias("cottages:feldweg_curve_bamboo", "cottages:feldweg_curve")
	minetest.register_alias("cottages:feldweg_end_bamboo", "cottages:feldweg_end")
	minetest.register_alias("cottages:feldweg_slope_bamboo", "cottages:feldweg_slope")
	minetest.register_alias("cottages:feldweg_slope_long_bamboo", "cottages:feldweg_slope_long")
	minetest.register_alias("cottages:feldweg_t_junction_bamboo", "cottages:feldweg_t_junction")
end