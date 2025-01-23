local mod_names = {
	["basic_materials"] = true,
	["bedrock"] = true,
	["caverealms"] = true,
	["farming"] = true,
	["mesecons_stickyblocks"] = true,
	["mobs"] = true,
	["moreblocks"] = true,
	["moreores"] = true
}

local cuttable_nodes = {}

for nodename, def in pairs(minetest.registered_nodes) do
	local modname = nodename:split(":")[1]
	if mod_names[modname] and xdecor.stairs_valid_def(def) then
		cuttable_nodes[#cuttable_nodes + 1] = nodename
	end
end

for i = 1, #cuttable_nodes do
	xdecor.register_cut(cuttable_nodes[i])
end