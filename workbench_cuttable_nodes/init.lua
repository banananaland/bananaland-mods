local mod_names = {
	"basic_materials",
	"bedrock",
	"caverealms",
	"farming",
	"mesecons_stickyblocks",
	"mobs",
	"moreblocks",
	"moreores"
}

local cuttable_nodes = {}

for nodename, def in pairs(minetest.registered_nodes) do
	for _, mod_name in ipairs(mod_names) do
		local modname = nodename:split(":")[1]
		if mod_name == modname and xdecor.stairs_valid_def(def) then
			cuttable_nodes[#cuttable_nodes + 1] = nodename
		end
	end
end

for i = 1, #cuttable_nodes do
	xdecor.register_cut(cuttable_nodes[i])
end