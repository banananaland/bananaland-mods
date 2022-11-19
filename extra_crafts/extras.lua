minetest.register_craft({
  type = "shapeless",
  output = "moreblocks:stone_tile 2",
  recipe = { "xdecor:stone_tile" },
})

minetest.register_craft({
  type = "shapeless",
  output = "moreblocks:circle_stone_bricks",
  recipe = { "xdecor:stone_rune" },
})


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
