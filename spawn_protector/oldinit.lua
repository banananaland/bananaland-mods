minetest.register_privilege("spawn_editor", {
	description = "May edit spawn.",
	give_to_singleplayer= false,
})

local old_is_spawn = minetest.is_protected
function minetest.is_protected(pos, name)
	if (pos.y > -2100 and pos.y < 2100 and pos.x > -21 and pos.x < 21 and pos.z > -21 and pos.z < 21 and  not minetest.get_player_privs(name).spawn_editor) then
		minetest.chat_send_player(name, name.. ": Spawn is the  protected location on this server.", true)
		minetest.chat_send_player(name, "There are 4 tall tree block poles marking the 4 corners of the spawn protected area.", true)
		minetest.chat_send_player(name, "Also not possible to dig under or build over spawn", true)
		minetest.chat_send_player(name, "Please go outside this area if you want to mine/build.", true)
		
		local tplayer = minetest.get_player_by_name(name)
		tplayer:setpos({x=200, y=20, z=200})
		return true
	end
	return old_is_spawn(pos, name)
end

--[[punch at spawn 
minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	local hit_pos = hitter:getpos()
	local pl_pos =  player:getpos()
		if (hit_pos.y > -21 and hit_pos.y < 21 and hit_pos.x > -21 and hit_pos.x < 21 and hit_pos.z > -21 and hit_pos.z < 21 and  not minetest.get_player_privs(hitter:get_player_name()).server) then
			--local hitter_player = minetest.get_player_by_name(hitter)
			hitter:setpos({x=200, y=20, z=200})
			return damage
		end
end)]]
