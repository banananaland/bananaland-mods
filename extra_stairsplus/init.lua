if minetest.get_modpath("caverealms") then
  local cave_nodes = { -- Default stairs/slabs/panels/microblocks:
    "caverealms:glow_crystal",
    "caverealms:glow_emerald",
    "caverealms:glow_mese",
    "caverealms:glow_ore",
    "caverealms:glow_emerald_ore",
    "caverealms:glow_ruby",
    "caverealms:glow_amethyst",
    "caverealms:glow_ruby_ore",
    "caverealms:salt_crystal",
    "caverealms:stone_with_salt",
    "caverealms:glow_obsidian",
    "caverealms:glow_obsidian_glass",
  }

  for _, name in pairs(cave_nodes) do
    local nodename = "caverealms:" .. name
    local a, b = string.find(name, ":")
    if b then
      nodename = name
      name = string.sub(name, b + 1)
    end
    local ndef = minetest.registered_nodes[nodename]
    if ndef then
      local drop
      if type(ndef.drop) == "string" then
        drop = ndef.drop:sub((b or 8) + 1)
      end

      local tiles = ndef.tiles
      if #ndef.tiles > 1 and ndef.drawtype:find("glass") then
        tiles = { ndef.tiles[1] }
      end

      stairsplus:register_all("caverealms", name, nodename, {
        description = ndef.description,
        drop = drop,
        groups = ndef.groups,
        sounds = ndef.sounds,
        tiles = tiles,
        sunlight_propagates = true,
        light_source = ndef.light_source
      })
    end
  end
end

if minetest.get_modpath("xdecor") then
  stairsplus:register_all("xdecor", "moonbrick", "xdecor:moonbrick", {
    description = "moonbrick",
    tiles = { "xdecor_moonbrick.png", "xdecor_moonbrick.png", "xdecor_moonbrick.png" },
    groups = { cracky = 2 },
    sounds = default.node_sound_stone_defaults(),
  })

  stairsplus:register_all("xdecor", "cactusbrick", "xdecor:cactusbrick", {
    description = "cactusbrick",
    tiles = { "xdecor_cactusbrick.png", "xdecor_cactusbrick.png", "xdecor_cactusbrick.png" },
    groups = { cracky = 2 },
    sounds = default.node_sound_stone_defaults(),
  })
end

local clay_def = minetest.registered_nodes["default:clay"]
stairs.register_stair_and_slab(
  "clay",
  "default:clay",
  clay_def.groups,
  clay_def.tiles,
  "Clay Stair",
  "Clay Slab",
  clay_def.sounds),
  false
end