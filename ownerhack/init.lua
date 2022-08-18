local function ownerhack_onuse(itemstack,user,pointed_thing)
if pointed_thing.type~="node" then return false end

if minetest.check_player_privs(user:get_player_name(), {server=true})==false then
	minetest.chat_send_player(user:get_player_name(), "You are not allowed to use this tool")
	user:set_wielded_item(nil)
	print(user:get_player_name() .." is trying to use ownerhack")
	return itemstack
end
	local p=pointed_thing.under
	local meta = minetest.get_meta(p)
	local owner=""
	local ste="infotext"
if meta:get_string("owner")~="" then
	owner=meta:get_string("owner")
	ste="owner"
end
if meta:get_string("doors_owner")~="" then
	owner=meta:get_string("doors_owner")
	ste="doors_owner"
end
local owner= meta:get_string("owner")
local text="size[9,9]" ..
	"list[context;tpg;2,1;1,1;]" ..
	"button_exit[0,0; 1.5,1;tpgs;Send]" ..
	"textarea[2,0;3,1;ohtowner;String to edit;" .. ste  .."]" ..
	"textarea[5,0;4,1;oht;Value;" .. owner  .."]" ..
	"textarea[2,1;4,1;ohtpos;Postion of meta;" .. p.x .." ".. p.y .." ".. p.z  .."]" ..
	"textarea[1,2.1;8,8;wive;Full view of meta (not editable);" ..  dump(meta:to_table())  .."]" 
minetest.show_formspec(user:get_player_name(), "OHT",text)
end

minetest.register_on_player_receive_fields(function(player, form, pressed)
	if form=="OHT" and pressed.tpgs then
local pos=pressed.ohtpos.split(pressed.ohtpos," ")
if pos[1]==nil or pos[2]==nil or pos[3]==nil then return end
local pos2={x=tonumber(pos[1]),y=tonumber(pos[2]),z=tonumber(pos[3])}
local meta = minetest.get_meta(pos2)
if meta:get_string(pressed.ohtowner)==nil then return end
		meta:set_string(pressed.ohtowner,pressed.oht)
	end
end)

minetest.register_tool("ownerhack:tool", {
	description = "Owner hack tool",
	inventory_image = "default_stick.png",
	range = 2,
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user, pointed_thing)
	ownerhack_onuse(itemstack,user,pointed_thing)
	return itemstack
	end,
	on_place = function(itemstack, user, pointed_thing)
	ownerhack_onuse(itemstack,user,pointed_thing)
		return itemstack
	end,
})
minetest.register_alias("hacktool", "ownerhack:tool")