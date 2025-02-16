if minetest.get_modpath("caverealms") then
	local cave_nodes = {
		"glow_amethyst",
		"glow_emerald_ore",
		"glow_obsidian",
		"glow_ore",
		"glow_ruby",
		"glow_ruby_ore",
		"salt_crystal",
		"stone_with_salt"
	}

	for _, name in ipairs(cave_nodes) do
		local nodename = "caverealms:" .. name
		local ndef = table.copy(minetest.registered_nodes[nodename])

		if #ndef.tiles > 1 and ndef.drawtype:find("glass") then
			ndef.tiles = {ndef.tiles[1]}
		end

		stairsplus:register_all("caverealms", name, nodename, ndef)
	end
end

if minetest.get_modpath("xdecor") then
	local nodes = {"cactusbrick", "moonbrick"}
	for _, name in ipairs(nodes) do
		local nodename = "xdecor:" .. name
		local ndef = minetest.registered_nodes[nodename]
		stairsplus:register_all("xdecor", name, nodename, ndef)
	end
end