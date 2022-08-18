minetest.register_privilege("spawn_editor", {
	description = "May edit spawn.",
	give_to_singleplayer= false,
})

local old_is_spawn = minetest.is_protected
function minetest.is_protected(pos, name)
	if (pos.y > -30 and pos.y < 31000 and pos.x > -26 and pos.x < 27 and pos.z > 26 and pos.z < 67 and  not minetest.get_player_privs(name).spawn_editor) then
		minetest.chat_send_player(name, name.. ", the spawn area is protected.", true)
		

		
		--[[local tplayer = minetest.get_player_by_name(name)
		if (pos.y > -22) then
			tplayer:setpos({x=200, y=20, z=200})
			minetest.chat_send_player(name, "Teleporting you out of spawn.", true)
			minetest.log("info", "Tried to break blocks at spawn. and was teleported  to 20,20,20")
		end]]
		return true
	end
	return old_is_spawn(pos, name)
end

--punch at spawn 
minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	local hit_pos = hitter:getpos()
	local pl_pos =  player:getpos()
		if (pl_pos.y > 5 and pl_pos.y < 30 and pl_pos.x > -14 and pl_pos.x < 17 and pl_pos.z > 25 and pl_pos.z < 63 and not minetest.get_player_privs(hitter:get_player_name()).spawn_editor) then
			--local hitter_player = minetest.get_player_by_name(hitter)
			minetest.chat_send_player(hitter:get_player_name(), hitter:get_player_name().. ": PvP is disabled in spawn. \n Spawn is a safe place.", true)

			minetest.log("info", "Tried to PvP at spawn.")
			return damage
		end
end)
