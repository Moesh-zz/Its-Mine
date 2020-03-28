import os

DROP_NOTHING = """{
    "type": "minecraft:block",
    "pools": [
        {
        "rolls": 1,
        "entries": [
            {
            "type": "minecraft:loot_table",
            "name": "minecraft:empty"
            }
        ]
        }
    ]
}"""

DROP_SCAFFOLDING = """{
    "type": "minecraft:block",
    "pools": [
        {
        "rolls": 1,
        "entries": [
            {
            "type": "minecraft:loot_table",
            "name": "moesh:gameplay/drop_scaffolding"
            }
        ]
        }
    ]
}"""

DROP_COAL_ORE = """{
  "type": "minecraft:block",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:alternatives",
          "children": [
            {
              "type": "minecraft:item",
              "functions": [
                {
                  "function": "minecraft:apply_bonus",
                  "enchantment": "minecraft:fortune",
                  "formula": "minecraft:ore_drops"
                },
                {
                  "function": "minecraft:explosion_decay"
                }
              ],
              "name": "minecraft:coal"
            }
          ]
        }
      ]
    }
  ]
}"""

DROP_IRON_INGOT = """{
  "type": "minecraft:block",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:iron_ingot"
        }
      ],
      "conditions": [
        {
          "condition": "minecraft:survives_explosion"
        }
      ]
    }
  ]
}"""

DROP_GOLD_INGOT = """{
  "type": "minecraft:block",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:gold_ingot"
        }
      ],
      "conditions": [
        {
          "condition": "minecraft:survives_explosion"
        }
      ]
    }
  ]
}"""

DROP_REDSTONE_ORE = """{
  "type": "minecraft:block",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:redstone"
        }
      ],
      "conditions": [
        {
          "condition": "minecraft:survives_explosion"
        }
      ]
    }
  ]
}"""

DROP_DIAMOND_ORE = """{
  "type": "minecraft:block",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:alternatives",
          "children": [
            {
              "type": "minecraft:item",
              "functions": [
                {
                  "function": "minecraft:apply_bonus",
                  "enchantment": "minecraft:fortune",
                  "formula": "minecraft:ore_drops"
                },
                {
                  "function": "minecraft:explosion_decay"
                }
              ],
              "name": "minecraft:diamond"
            }
          ]
        }
      ]
    }
  ]
}"""

DROP_EMERALD_ORE = """{
  "type": "minecraft:block",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:alternatives",
          "children": [
            {
              "type": "minecraft:item",
              "functions": [
                {
                  "function": "minecraft:apply_bonus",
                  "enchantment": "minecraft:fortune",
                  "formula": "minecraft:ore_drops"
                },
                {
                  "function": "minecraft:explosion_decay"
                }
              ],
              "name": "minecraft:emerald"
            }
          ]
        }
      ]
    }
  ]
}"""

DROP_LAPIS_ORE = """{
  "type": "minecraft:block",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:alternatives",
          "children": [
            {
              "type": "minecraft:item",
              "functions": [
                {
                  "function": "minecraft:set_count",
                  "count": {
                    "min": 4.0,
                    "max": 9.0,
                    "type": "minecraft:uniform"
                  }
                },
                {
                  "function": "minecraft:apply_bonus",
                  "enchantment": "minecraft:fortune",
                  "formula": "minecraft:ore_drops"
                },
                {
                  "function": "minecraft:explosion_decay"
                }
              ],
              "name": "minecraft:lapis_lazuli"
            }
          ]
        }
      ]
    }
  ]
}"""

# This is the brain of the operation. This table will indicate what block drops should have ores,
# and then we specify what drops nothing. Any block not mentioned here drops scaffolding. This
# list is ALWAYS first updated in _DROPS.md, and then copied over here.
LOOT_TABLES = {
    "coal_ore": DROP_COAL_ORE,
    "iron_ore": DROP_IRON_INGOT,
    "gold_ore": DROP_GOLD_INGOT,
    "redstone_ore": DROP_REDSTONE_ORE,
    "diamond_ore": DROP_DIAMOND_ORE,
    "emerald_ore": DROP_EMERALD_ORE,
    "lapis_ore": DROP_LAPIS_ORE,

    "acacia_sapling": DROP_NOTHING,
    "allium": DROP_NOTHING,
    "attached_melon_stem": DROP_NOTHING,
    "attached_pumpkin_stem": DROP_NOTHING,
    "azure_bluet": DROP_NOTHING,
    "bamboo_sapling": DROP_NOTHING,
    "beetroots": DROP_NOTHING,
    "black_stained_glass": DROP_NOTHING,
    "black_stained_glass_pane": DROP_NOTHING,
    "blue_ice": DROP_NOTHING,
    "blue_orchid": DROP_NOTHING,
    "blue_stained_glass": DROP_NOTHING,
    "blue_stained_glass_pane": DROP_NOTHING,
    "brain_coral": DROP_NOTHING,
    "brain_coral_fan": DROP_NOTHING,
    "brown_mushroom": DROP_NOTHING,
    "brown_stained_glass": DROP_NOTHING,
    "brown_stained_glass_pane": DROP_NOTHING,
    "bubble_coral": DROP_NOTHING,
    "bubble_coral_fan": DROP_NOTHING,
    "cake": DROP_NOTHING,
    "carrots": DROP_NOTHING,
    "chorus_flower": DROP_NOTHING,
    "chorus_plant": DROP_NOTHING,
    "cobweb": DROP_NOTHING,
    "cocoa": DROP_NOTHING,
    "cornflower": DROP_NOTHING,
    "creeper_head": DROP_NOTHING,
    "cyan_stained_glass": DROP_NOTHING,
    "cyan_stained_glass_pane": DROP_NOTHING,
    "dandelion": DROP_NOTHING,
    "dark_oak_sapling": DROP_NOTHING,
    "dead_brain_coral": DROP_NOTHING,
    "dead_brain_coral_fan": DROP_NOTHING,
    "dead_bubble_coral": DROP_NOTHING,
    "dead_bubble_coral_fan": DROP_NOTHING,
    "dead_bush": DROP_NOTHING,
    "dead_fire_coral": DROP_NOTHING,
    "dead_fire_coral_fan": DROP_NOTHING,
    "dead_horn_coral": DROP_NOTHING,
    "dead_horn_coral_fan": DROP_NOTHING,
    "dead_tube_coral": DROP_NOTHING,
    "dead_tube_coral_fan": DROP_NOTHING,
    "dragon_egg": DROP_NOTHING,
    "dragon_head": DROP_NOTHING,
    "fern": DROP_NOTHING,
    "fire_coral": DROP_NOTHING,
    "fire_coral_fan": DROP_NOTHING,
    "frosted_ice": DROP_NOTHING,
    "glass": DROP_NOTHING,
    "glass_pane": DROP_NOTHING,
    "grass": DROP_NOTHING,
    "gray_stained_glass": DROP_NOTHING,
    "gray_stained_glass_pane": DROP_NOTHING,
    "green_stained_glass": DROP_NOTHING,
    "green_stained_glass_pane": DROP_NOTHING,
    "heavy_weighted_pressure_plate": DROP_NOTHING,
    "horn_coral": DROP_NOTHING,
    "horn_coral_fan": DROP_NOTHING,
    "ice": DROP_NOTHING,
    "infested_chiseled_stone_bricks": DROP_NOTHING,
    "infested_cobblestone": DROP_NOTHING,
    "infested_cracked_stone_bricks": DROP_NOTHING,
    "infested_mossy_stone_bricks": DROP_NOTHING,
    "infested_stone": DROP_NOTHING,
    "infested_stone_bricks": DROP_NOTHING,
    "jungle_leaves": DROP_NOTHING,
    "jungle_pressure_plate": DROP_NOTHING,
    "jungle_sapling": DROP_NOTHING,
    "kelp": DROP_NOTHING,
    "kelp_plant": DROP_NOTHING,
    "large_fern": DROP_NOTHING,
    "light_blue_stained_glass": DROP_NOTHING,
    "light_blue_stained_glass_pane": DROP_NOTHING,
    "light_gray_stained_glass": DROP_NOTHING,
    "light_gray_stained_glass_pane": DROP_NOTHING,
    "light_weighted_pressure_plate": DROP_NOTHING,
    "lilac": DROP_NOTHING,
    "lily_of_the_valley": DROP_NOTHING,
    "lily_pad": DROP_NOTHING,
    "lime_stained_glass": DROP_NOTHING,
    "lime_stained_glass_pane": DROP_NOTHING,
    "magenta_stained_glass": DROP_NOTHING,
    "magenta_stained_glass_pane": DROP_NOTHING,
    "melon_stem": DROP_NOTHING,
    "mushroom_stem": DROP_NOTHING,
    "oak_leaves": DROP_NOTHING,
    "oak_pressure_plate": DROP_NOTHING,
    "oak_sapling": DROP_NOTHING,
    "orange_stained_glass": DROP_NOTHING,
    "orange_stained_glass_pane": DROP_NOTHING,
    "oxeye_daisy": DROP_NOTHING,
    "packed_ice": DROP_NOTHING,
    "peony": DROP_NOTHING,
    "pink_stained_glass": DROP_NOTHING,
    "pink_stained_glass_pane": DROP_NOTHING,
    "pink_tulip": DROP_NOTHING,
    "player_head": DROP_NOTHING,
    "poppy": DROP_NOTHING,
    "potatoes": DROP_NOTHING,
    "potted_acacia_sapling": DROP_NOTHING,
    "potted_allium": DROP_NOTHING,
    "potted_azure_bluet": DROP_NOTHING,
    "potted_bamboo": DROP_NOTHING,
    "potted_birch_sapling": DROP_NOTHING,
    "potted_blue_orchid": DROP_NOTHING,
    "potted_brown_mushroom": DROP_NOTHING,
    "potted_cactus": DROP_NOTHING,
    "potted_cornflower": DROP_NOTHING,
    "potted_dandelion": DROP_NOTHING,
    "potted_dark_oak_sapling": DROP_NOTHING,
    "potted_dead_bush": DROP_NOTHING,
    "potted_fern": DROP_NOTHING,
    "potted_jungle_sapling": DROP_NOTHING,
    "potted_lily_of_the_valley": DROP_NOTHING,
    "potted_oak_sapling": DROP_NOTHING,
    "potted_orange_tulip": DROP_NOTHING,
    "potted_oxeye_daisy": DROP_NOTHING,
    "potted_pink_tulip": DROP_NOTHING,
    "potted_poppy": DROP_NOTHING,
    "potted_red_mushroom": DROP_NOTHING,
    "potted_red_tulip": DROP_NOTHING,
    "potted_spruce_sapling": DROP_NOTHING,
    "potted_white_tulip": DROP_NOTHING,
    "potted_wither_rose": DROP_NOTHING,
    "powered_rail": DROP_NOTHING,
    "prismarine": DROP_NOTHING,
    "prismarine_brick_slab": DROP_NOTHING,
    "prismarine_brick_stairs": DROP_NOTHING,
    "prismarine_bricks": DROP_NOTHING,
    "prismarine_slab": DROP_NOTHING,
    "prismarine_stairs": DROP_NOTHING,
    "prismarine_wall": DROP_NOTHING,
    "pumpkin": DROP_NOTHING,
    "pumpkin_stem": DROP_NOTHING,
    "purple_stained_glass": DROP_NOTHING,
    "purple_stained_glass_pane": DROP_NOTHING,
    "red_mushroom": DROP_NOTHING,
    "red_stained_glass": DROP_NOTHING,
    "red_stained_glass_pane": DROP_NOTHING,
    "red_tulip": DROP_NOTHING,
    "redstone_torch": DROP_NOTHING,
    "redstone_wire": DROP_NOTHING,
    "rose_bush": DROP_NOTHING,
    "sea_pickle": DROP_NOTHING,
    "seagrass": DROP_NOTHING,
    "skeleton_skull": DROP_NOTHING,
    "snow": DROP_NOTHING,
    "spawner": DROP_NOTHING,
    "spruce_leaves": DROP_NOTHING,
    "spruce_pressure_plate": DROP_NOTHING,
    "spruce_sapling": DROP_NOTHING,
    "stone_pressure_plate": DROP_NOTHING,
    "sugar_cane": DROP_NOTHING,
    "sunflower": DROP_NOTHING,
    "sweet_berry_bush": DROP_NOTHING,
    "tall_grass": DROP_NOTHING,
    "tall_seagrass": DROP_NOTHING,
    "torch": DROP_NOTHING,
    "tripwire": DROP_NOTHING,
    "tripwire_hook": DROP_NOTHING,
    "tube_coral": DROP_NOTHING,
    "tube_coral_fan": DROP_NOTHING,
    "turtle_egg": DROP_NOTHING,
    "vine": DROP_NOTHING,
    "wheat": DROP_NOTHING,
    "white_stained_glass": DROP_NOTHING,
    "white_stained_glass_pane": DROP_NOTHING,
    "white_tulip": DROP_NOTHING,
    "wither_rose": DROP_NOTHING,
    "wither_skeleton_skull": DROP_NOTHING,
    "yellow_stained_glass": DROP_NOTHING,
    "yellow_stained_glass_pane": DROP_NOTHING,
    "zombie_head": DROP_NOTHING,
}

# This script exists inside the directory it will be running in.
dir_contents = next(os.walk("."))
files = dir_contents[2]

for file in files:
    if not file.endswith(".json"):
        continue

    print(file)
    block = file[0:-5]

    with open(file, "w") as output:
        loot_table_contents = LOOT_TABLES.get(block, DROP_SCAFFOLDING)
        output.write(loot_table_contents)

        