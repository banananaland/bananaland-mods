minetest.register_tool("fusion_tools:obsidian_fused", {
	description = "Obsidian Fused Tools",
	inventory_image = "fusion_tools_obsidianfused.png",
	range = 10,
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=0.40, [2]=0.20, [3]=0.10}, uses=600, maxlevel=3},
			crumbly = {times={[1]=0.30, [2]=0.15, [3]=0.1}, uses=600, maxlevel=3},
			bendy = {times={[1]=0.30, [2]=0.15, [3]=0.1}, uses=600, maxlevel=3},
			choppy={times={[1]=0.30, [2]=0.15, [3]=0.1}, uses=600, maxlevel=3},
			snappy={times={[1]=0.30, [2]=0.15, [3]=0.1}, uses=600, maxlevel=3},
            oddly_breakable_by_hand={times={[1]=0.30, [2]=0.15, [3]=0.1}, uses=0, maxlevel=3},
            dig_immediate={times={[1]=0.15, [2]=0.10, [3]=0.05}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=8},
        
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1,not_in_creative_inventory = 1}
})


minetest.register_tool("fusion_tools:fused_diamond_v2", {
	description = "Diamond Fused Tools",
	inventory_image = "fusion_tools_diamondfused.png",
	range = 8,
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=0.60, [2]=0.40, [3]=0.30}, uses=200, maxlevel=3},
			crumbly = {times={[1]=0.50, [2]=0.30, [3]=0.20}, uses=200, maxlevel=3},
			bendy = {times={[1]=0.50, [2]=0.30, [3]=0.20}, uses=200, maxlevel=3},
			choppy={times={[1]=0.50, [2]=0.30, [3]=0.20}, uses=200, maxlevel=3},
			snappy={times={[1]=0.50, [2]=0.30, [3]=0.20}, uses=200, maxlevel=3},
            oddly_breakable_by_hand={times={[1]=0.50, [2]=0.30, [3]=0.20}, uses=200, maxlevel=3},
            dig_immediate={times={[1]=0.25, [2]=0.15, [3]=0.05}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=8},
        
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_tool("fusion_tools:fused_mese_v2", {
	description = "Mese Fused Tools",
	inventory_image = "fusion_tools_mesefused.png",
    range = 6,
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=1.8, [2]=1.2, [3]=0.60}, uses=70, maxlevel=3},
			crumbly = {times={[1]=0.80, [2]=0.60, [3]=0.30}, uses=70, maxlevel=3},
			bendy = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=70, maxlevel=3},
			choppy={times={[1]=1.20, [2]=1.00, [3]=0.60}, uses=70, maxlevel=3},
			snappy={times={[1]=1.5, [2]=1.00, [3]=0.35}, uses=70, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})
minetest.register_tool("fusion_tools:fused_steel", {
	description = "Steel Fused Tools",
	inventory_image = "fusion_tools_steelfused.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=3.20, [2]=1.60, [3]=0.80}, uses=50, maxlevel=2},
			crumbly = {times={[1]=1.40, [2]=0.70, [3]=0.40}, uses=50, maxlevel=2},
			bendy = {times={[1]=1.90, [2]=1.30, [3]=0.40}, uses=50, maxlevel=2},
			choppy={times={[1]=1.40, [2]=1.20, [3]=1.10}, uses=50, maxlevel=2},
			snappy={times={[1]=1.9, [2]=1.20, [3]=0.55}, uses=50, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})


-- Diamond

minetest.register_craft({
    type = "shapeless",
	output = 'fusion_tools:fused_diamond_v2',
	recipe = {'default:pick_diamond','default:axe_diamond','default:shovel_diamond','default:sword_diamond'},
})
--mese
minetest.register_craft({
    type = "shapeless",
	output = 'fusion_tools:fused_mese_v2',
	recipe = {'default:pick_mese','default:axe_mese','default:shovel_mese'},
})

minetest.register_craft({
    type = "shapeless",
	output = 'fusion_tools:fused_steel',
	recipe = {'default:pick_steel','default:shovel_steel'},
})
