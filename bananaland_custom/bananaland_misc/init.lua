local MP = minetest.get_modpath("bananaland_misc") .. "/"

dofile(MP .. "aliases.lua")

if minetest.global_exists("default") and minetest.global_exists("stairs") then -- for switching cottages to flux's fork
	local clay_def = minetest.registered_nodes["default:clay"]
	stairs.register_stair_and_slab(
		"clay",
		"default:clay",
		clay_def.groups,
		clay_def.tiles,
		"Clay Stair",
		"Clay Slab",
		clay_def.sounds,
		false
	)
end

if minetest.get_modpath("extra_doors") then -- fix extra_doors texture name
	local function door_tiles_overwrite(name)
		minetest.override_item(name, {
			tiles = {{name = "doors_door_steelpanel1.png", backface_culling = true}}
		})
	end
	door_tiles_overwrite("doors:door_steelpanel1_a")
	door_tiles_overwrite("doors:door_steelpanel1_b")
	door_tiles_overwrite("doors:door_steelpanel1_c")
	door_tiles_overwrite("doors:door_steelpanel1_d")
end

if minetest.global_exists("basic_machines") then
	if minetest.global_exists("areas") and minetest.global_exists("protector") then -- areas mod and mt-mods/protector mod
		local protector_radius = tonumber(minetest.settings:get("protector_radius")) or 5
		basic_machines.is_protected = function(pos, machine_owner)
			if protector.can_dig(protector_radius, pos, machine_owner, false, 3) and areas:canInteract(pos, machine_owner) then
				return false
			end
	
			return true
		end
	end
end
