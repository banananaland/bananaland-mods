minetest.register_privilege("owntime", "able to set their own time of day.")

minetest.register_chatcommand("mytime", {
	params = "day|night|supernight|default",
	description = "Change your own time of day",
	privs = {interact = true},
	func = function(name,param)
		local player = minetest.get_player_by_name(name) 
		if param == "day" or param == "noon"  then
			player:override_day_night_ratio(1)
			minetest.chat_send_player(player:get_player_name(),"You have set your time to day.")
			
		elseif param == "night" or param == "dark" then
			player:override_day_night_ratio(0.15)
			minetest.chat_send_player(player:get_player_name(),"You have set your time to night.")
			
		elseif param == "late_evening" or param == "early_morning" then
			player:override_day_night_ratio(0.4)
			minetest.chat_send_player(player:get_player_name(),"You have set your time to Late Evening/Early Morning.")
			
		elseif param == "evening" or param == "morning" then
			player:override_day_night_ratio(0.6)
			minetest.chat_send_player(player:get_player_name(),"You have set your time to Evening/Morning.")
			
		elseif param == "early_evening" or param == "late_morning" then
			player:override_day_night_ratio(0.8)
			minetest.chat_send_player(player:get_player_name(),"You have set your time to early Evening/Late Morning.")
			
			
		elseif param == "early_noon" or param == "late_morning2" then
			player:override_day_night_ratio(0.95)
			minetest.chat_send_player(player:get_player_name(),"You have set your time to early earlynoon/Late Morning2.")

			
		elseif param == "supernight" or param == "moonless" then
			player:override_day_night_ratio(0)
			minetest.chat_send_player(player:get_player_name(),"You have set your time to moonless night")

		elseif param == "off" or param == "default" then
			player:override_day_night_ratio(nil)
			minetest.chat_send_player(player:get_player_name(),"You have set your time to the server's time")


		else
			minetest.chat_send_player(player:get_player_name(),"Not a valid time setting.\nvValid settings:day,night,late_evening,morning,late_morning,early_noon,moonless,default")
		end
		
	end,
})
