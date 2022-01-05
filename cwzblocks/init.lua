minetest.register_node("cwzblocks:glossydark", {
	tiles = {"cwzblocks_glossydark.png"},
	description = "Glossy Dark",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})


minetest.register_node("cwzblocks:darkbrick", {
	tiles = {"cwzblocks_darkbrick.png"},
	description = "Dark Brick",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("cwzblocks:embossed_steel", {
	tiles = {"cwzblocks_embossed_steel.png"},
	description = "Embossed Steel",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})


-- default registrations
local default_nodes = { -- Default stairs/slabs/panels/microblocks:
	"glossydark",
	"darkbrick",
	"embossed_steel",

}

for _, name in pairs(default_nodes) do
	local mod = "cwzblocks"
	local nodename = mod .. ":" .. name
	local ndef = table.copy(minetest.registered_nodes[nodename])
	ndef.sunlight_propagates = true

	-- Stone and desert_stone drop cobble and desert_cobble respectively.
	if type(ndef.drop) == "string" then
		ndef.drop = ndef.drop:gsub(".+:", "")
	end

	-- Use the primary tile for all sides of cut glasslike nodes and disregard paramtype2.
	if #ndef.tiles > 1 and ndef.drawtype and ndef.drawtype:find("glass") then
		ndef.tiles = {ndef.tiles[1]}
		ndef.paramtype2 = nil
	end

	mod = "cwzblocks"
	stairsplus:register_all(mod, name, nodename, ndef)
	minetest.register_alias_force("stairs:stair_" .. name, mod .. ":stair_" .. name)
	minetest.register_alias_force("stairs:stair_outer_" .. name, mod .. ":stair_" .. name .. "_outer")
	minetest.register_alias_force("stairs:stair_inner_" .. name, mod .. ":stair_" .. name .. "_inner")
	minetest.register_alias_force("stairs:slab_"  .. name, mod .. ":slab_"  .. name)
end


minetest.register_craft({
        output = 'cwzblocks:glossydark 4',
        recipe = {
                { 'default:obsidian_glass', '',     'default:obsidian_glass' },
                { '',              'default:coalblock', '' },
                { 'default:obsidian_glass',   '',   'default:obsidian_glass' },
        }
})

minetest.register_craft({
        output = 'cwzblocks:darkbrick 4',
        recipe = {
                { 'dye:brown', '',     'dye:brown' },
                { '',              'default:stonebrick', '' },
                { 'dye:brown',   '',   'dye:brown' },
        }
})

-- 

minetest.register_craft({
        output = 'cwzblocks:embossed_steel 4',
        recipe = {
                { '',              'building_blocks:grate',     '' },
                { '',              'default:steelblock', '' },
                { '',   '',   '' },
        }
})
