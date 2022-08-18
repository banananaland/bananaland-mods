minetest.register_privilege("spawn_editor", {
	description = "May edit spawn.",
	give_to_singleplayer= false,
})

local old_is_spawn = minetest.is_protected
function minetest.is_protected(pos, name)
	if pos.x < -31000 or pos.x > 31000 then return end
	if (pos.y > -30 and pos.y < 31000 and pos.x > -26 and pos.x < 28 and pos.z > 26 and pos.z < 67 and  not minetest.get_player_privs(name).spawn_editor) then
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


local location = 0
local strike = 0

--punch at spawn 
minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	local hit_pos = hitter:getpos()
	local pl_pos =  player:getpos()
		if hit_pos.x < -31000 or hit_pos.x > 31000 then return end
		if pl_pos.x < -31000 or pl_pos.x > 31000 then return end
		if (pl_pos.y > 5 and pl_pos.y < 30 and pl_pos.x > -14 and pl_pos.x < 17 and pl_pos.z > 25 and pl_pos.z < 63 and not minetest.get_player_privs(hitter:get_player_name()).spawn_editor) then
			--local hitter_player = minetest.get_player_by_name(hitter)
			minetest.chat_send_player(hitter:get_player_name(), hitter:get_player_name().. ": PvP is disabled in spawn. \nSpawnkilling is disallowed.", true)

			minetest.log("info", hitter:get_player_name().." tried to PvP at spawn.")
			
			if (hitter:is_player()) then
			
				if location == 0 or location == nil then --desert dazzle
					hitter:setpos({x=763, y=20, z=-1049}) 
					location = 1
					minetest.chat_send_player(hitter:get_player_name(), hitter:get_player_name().. ", you've been relocated", true)
					
				elseif location == 1 then --Giligan
					hitter:setpos({x=668, y=34, z=-1322})
					location = 2
					minetest.chat_send_player(hitter:get_player_name(), hitter:get_player_name().. ", you've been relocated", true)
					
				elseif location == 2 then --Zogola
					hitter:setpos({x=-212, y=32, z=-908})
					location = 3
					minetest.chat_send_player(hitter:get_player_name(), hitter:get_player_name().. ", you've been relocated", true)
					
				elseif location == 3 then --coolvil
					hitter:setpos({x=-285, y=13, z=34})
					location = 4
					minetest.chat_send_player(hitter:get_player_name(), hitter:get_player_name().. ", you've been relocated", true)
				elseif location == 4 then --random
					hitter:setpos({x=1500, y=19, z=300})
					location = 0
					minetest.chat_send_player(hitter:get_player_name(), hitter:get_player_name().. ", you've been relocated", true)
					
				else
					location = 0
				end
			else
				 hitter:remove()
			end
			
			
			
			return damage
			
		end
end)


