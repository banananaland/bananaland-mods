local message = minetest.setting_get("motd2")
local oldmessage = minetest.setting_get("motd2")

minetest.register_on_joinplayer(function(player)

	minetest.after(5, function(player)
			if message == "" or message == nil then return false
			
			else
				minetest.chat_send_player(player:get_player_name(),"[MOTD] "..message)
  			return
  			end
	end, player)
	
end)

minetest.register_chatcommand("motd2", {
	params = "",
	description = "Set motd",
	privs = {server=true},
	func = function(name, param)
		--param = (param ~= "" and param or name)
		if param == "" or param == nil then
			minetest.chat_send_player(name,"Current message is: "..message)
			
		elseif param == "show" then
			minetest.chat_send_all("[MOTD] "..message)
			
		elseif param == "restore" then
			message = oldmessage
			minetest.chat_send_player(name,"Message restored to: "..message)
			minetest.setting_set("motd2", message)
			minetest.setting_save()
		
		else
			oldmessage = message
			message = param 
			minetest.setting_set("motd2", message)
			minetest.setting_save()
			minetest.chat_send_player(name,"New message is: "..message)
		end
	end,
})

