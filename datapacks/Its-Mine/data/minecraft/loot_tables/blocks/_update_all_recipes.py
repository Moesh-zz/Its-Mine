#import json
import os

DROP_SCAFFOLDING_JSON = """{
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

DROP_NO_SCAFFOLDING_JSON = """{
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
              "conditions": [
                {
                  "condition": "minecraft:match_tool",
                  "predicate": {
                    "enchantments": [
                      {
                        "enchantment": "minecraft:silk_touch",
                        "levels": {
                          "min": 1
                        }
                      }
                    ]
                  }
                }
              ],
              "name": "minecraft:diamond_ore"
            },
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


LOOT_TABLES = {
    "coal_ore": DROP_COAL_ORE,
    "iron_ore": DROP_IRON_INGOT,
    "gold_ore": DROP_GOLD_INGOT,
    "redstone_ore": DROP_REDSTONE_ORE,
    "diamond_ore": DROP_DIAMOND_ORE,
    "emerald_ore": DROP_EMERALD_ORE,
    "lapis_ore": DROP_LAPIS_ORE,

    "acacia_sapling": DROP_NO_SCAFFOLDING_JSON,
    "allium": DROP_NO_SCAFFOLDING_JSON,
    "attached_melon_stem": DROP_NO_SCAFFOLDING_JSON,
    "attached_pumpkin_stem": DROP_NO_SCAFFOLDING_JSON,
    "azure_bluet": DROP_NO_SCAFFOLDING_JSON,
    "bamboo_sapling": DROP_NO_SCAFFOLDING_JSON,
    "beetroots": DROP_NO_SCAFFOLDING_JSON,
    "black_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "black_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "blue_ice": DROP_NO_SCAFFOLDING_JSON,
    "blue_orchid": DROP_NO_SCAFFOLDING_JSON,
    "blue_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "blue_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "brain_coral": DROP_NO_SCAFFOLDING_JSON,
    "brain_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "brown_mushroom": DROP_NO_SCAFFOLDING_JSON,
    "brown_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "brown_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "bubble_coral": DROP_NO_SCAFFOLDING_JSON,
    "bubble_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "cake": DROP_NO_SCAFFOLDING_JSON,
    "carrots": DROP_NO_SCAFFOLDING_JSON,
    "chorus_flower": DROP_NO_SCAFFOLDING_JSON,
    "chorus_plant": DROP_NO_SCAFFOLDING_JSON,
    "cobweb": DROP_NO_SCAFFOLDING_JSON,
    "cocoa": DROP_NO_SCAFFOLDING_JSON,
    "cornflower": DROP_NO_SCAFFOLDING_JSON,
    "creeper_head": DROP_NO_SCAFFOLDING_JSON,
    "cyan_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "cyan_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "dandelion": DROP_NO_SCAFFOLDING_JSON,
    "dark_oak_sapling": DROP_NO_SCAFFOLDING_JSON,
    "dead_brain_coral": DROP_NO_SCAFFOLDING_JSON,
    "dead_brain_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "dead_bubble_coral": DROP_NO_SCAFFOLDING_JSON,
    "dead_bubble_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "dead_bush": DROP_NO_SCAFFOLDING_JSON,
    "dead_fire_coral": DROP_NO_SCAFFOLDING_JSON,
    "dead_fire_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "dead_horn_coral": DROP_NO_SCAFFOLDING_JSON,
    "dead_horn_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "dead_tube_coral": DROP_NO_SCAFFOLDING_JSON,
    "dead_tube_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "dragon_egg": DROP_NO_SCAFFOLDING_JSON,
    "dragon_head": DROP_NO_SCAFFOLDING_JSON,
    "fern": DROP_NO_SCAFFOLDING_JSON,
    "fire_coral": DROP_NO_SCAFFOLDING_JSON,
    "fire_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "frosted_ice": DROP_NO_SCAFFOLDING_JSON,
    "glass": DROP_NO_SCAFFOLDING_JSON,
    "glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "grass": DROP_NO_SCAFFOLDING_JSON,
    "gray_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "gray_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "green_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "green_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "heavy_weighted_pressure_plate": DROP_NO_SCAFFOLDING_JSON,
    "horn_coral": DROP_NO_SCAFFOLDING_JSON,
    "horn_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "ice": DROP_NO_SCAFFOLDING_JSON,
    "infested_chiseled_stone_bricks": DROP_NO_SCAFFOLDING_JSON,
    "infested_cobblestone": DROP_NO_SCAFFOLDING_JSON,
    "infested_cracked_stone_bricks": DROP_NO_SCAFFOLDING_JSON,
    "infested_mossy_stone_bricks": DROP_NO_SCAFFOLDING_JSON,
    "infested_stone": DROP_NO_SCAFFOLDING_JSON,
    "infested_stone_bricks": DROP_NO_SCAFFOLDING_JSON,
    "jungle_leaves": DROP_NO_SCAFFOLDING_JSON,
    "jungle_pressure_plate": DROP_NO_SCAFFOLDING_JSON,
    "jungle_sapling": DROP_NO_SCAFFOLDING_JSON,
    "kelp": DROP_NO_SCAFFOLDING_JSON,
    "kelp_plant": DROP_NO_SCAFFOLDING_JSON,
    "large_fern": DROP_NO_SCAFFOLDING_JSON,
    "light_blue_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "light_blue_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "light_gray_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "light_gray_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "light_weighted_pressure_plate": DROP_NO_SCAFFOLDING_JSON,
    "lilac": DROP_NO_SCAFFOLDING_JSON,
    "lily_of_the_valley": DROP_NO_SCAFFOLDING_JSON,
    "lily_pad": DROP_NO_SCAFFOLDING_JSON,
    "lime_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "lime_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "magenta_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "magenta_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "melon_stem": DROP_NO_SCAFFOLDING_JSON,
    "mushroom_stem": DROP_NO_SCAFFOLDING_JSON,
    "oak_leaves": DROP_NO_SCAFFOLDING_JSON,
    "oak_pressure_plate": DROP_NO_SCAFFOLDING_JSON,
    "oak_sapling": DROP_NO_SCAFFOLDING_JSON,
    "orange_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "orange_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "oxeye_daisy": DROP_NO_SCAFFOLDING_JSON,
    "packed_ice": DROP_NO_SCAFFOLDING_JSON,
    "peony": DROP_NO_SCAFFOLDING_JSON,
    "pink_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "pink_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "pink_tulip": DROP_NO_SCAFFOLDING_JSON,
    "player_head": DROP_NO_SCAFFOLDING_JSON,
    "poppy": DROP_NO_SCAFFOLDING_JSON,
    "potatoes": DROP_NO_SCAFFOLDING_JSON,
    "potted_acacia_sapling": DROP_NO_SCAFFOLDING_JSON,
    "potted_allium": DROP_NO_SCAFFOLDING_JSON,
    "potted_azure_bluet": DROP_NO_SCAFFOLDING_JSON,
    "potted_bamboo": DROP_NO_SCAFFOLDING_JSON,
    "potted_birch_sapling": DROP_NO_SCAFFOLDING_JSON,
    "potted_blue_orchid": DROP_NO_SCAFFOLDING_JSON,
    "potted_brown_mushroom": DROP_NO_SCAFFOLDING_JSON,
    "potted_cactus": DROP_NO_SCAFFOLDING_JSON,
    "potted_cornflower": DROP_NO_SCAFFOLDING_JSON,
    "potted_dandelion": DROP_NO_SCAFFOLDING_JSON,
    "potted_dark_oak_sapling": DROP_NO_SCAFFOLDING_JSON,
    "potted_dead_bush": DROP_NO_SCAFFOLDING_JSON,
    "potted_fern": DROP_NO_SCAFFOLDING_JSON,
    "potted_jungle_sapling": DROP_NO_SCAFFOLDING_JSON,
    "potted_lily_of_the_valley": DROP_NO_SCAFFOLDING_JSON,
    "potted_oak_sapling": DROP_NO_SCAFFOLDING_JSON,
    "potted_orange_tulip": DROP_NO_SCAFFOLDING_JSON,
    "potted_oxeye_daisy": DROP_NO_SCAFFOLDING_JSON,
    "potted_pink_tulip": DROP_NO_SCAFFOLDING_JSON,
    "potted_poppy": DROP_NO_SCAFFOLDING_JSON,
    "potted_red_mushroom": DROP_NO_SCAFFOLDING_JSON,
    "potted_red_tulip": DROP_NO_SCAFFOLDING_JSON,
    "potted_spruce_sapling": DROP_NO_SCAFFOLDING_JSON,
    "potted_white_tulip": DROP_NO_SCAFFOLDING_JSON,
    "potted_wither_rose": DROP_NO_SCAFFOLDING_JSON,
    "powered_rail": DROP_NO_SCAFFOLDING_JSON,
    "prismarine": DROP_NO_SCAFFOLDING_JSON,
    "prismarine_brick_slab": DROP_NO_SCAFFOLDING_JSON,
    "prismarine_brick_stairs": DROP_NO_SCAFFOLDING_JSON,
    "prismarine_bricks": DROP_NO_SCAFFOLDING_JSON,
    "prismarine_slab": DROP_NO_SCAFFOLDING_JSON,
    "prismarine_stairs": DROP_NO_SCAFFOLDING_JSON,
    "prismarine_wall": DROP_NO_SCAFFOLDING_JSON,
    "pumpkin": DROP_NO_SCAFFOLDING_JSON,
    "pumpkin_stem": DROP_NO_SCAFFOLDING_JSON,
    "purple_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "purple_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "red_mushroom": DROP_NO_SCAFFOLDING_JSON,
    "red_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "red_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "red_tulip": DROP_NO_SCAFFOLDING_JSON,
    "redstone_torch": DROP_NO_SCAFFOLDING_JSON,
    "redstone_wire": DROP_NO_SCAFFOLDING_JSON,
    "rose_bush": DROP_NO_SCAFFOLDING_JSON,
    "sea_pickle": DROP_NO_SCAFFOLDING_JSON,
    "seagrass": DROP_NO_SCAFFOLDING_JSON,
    "skeleton_skull": DROP_NO_SCAFFOLDING_JSON,
    "snow": DROP_NO_SCAFFOLDING_JSON,
    "spawner": DROP_NO_SCAFFOLDING_JSON,
    "spruce_leaves": DROP_NO_SCAFFOLDING_JSON,
    "spruce_pressure_plate": DROP_NO_SCAFFOLDING_JSON,
    "spruce_sapling": DROP_NO_SCAFFOLDING_JSON,
    "stone_pressure_plate": DROP_NO_SCAFFOLDING_JSON,
    "sugar_cane": DROP_NO_SCAFFOLDING_JSON,
    "sunflower": DROP_NO_SCAFFOLDING_JSON,
    "sweet_berry_bush": DROP_NO_SCAFFOLDING_JSON,
    "tall_grass": DROP_NO_SCAFFOLDING_JSON,
    "tall_seagrass": DROP_NO_SCAFFOLDING_JSON,
    "torch": DROP_NO_SCAFFOLDING_JSON,
    "tripwire": DROP_NO_SCAFFOLDING_JSON,
    "tripwire_hook": DROP_NO_SCAFFOLDING_JSON,
    "tube_coral": DROP_NO_SCAFFOLDING_JSON,
    "tube_coral_fan": DROP_NO_SCAFFOLDING_JSON,
    "turtle_egg": DROP_NO_SCAFFOLDING_JSON,
    "vine": DROP_NO_SCAFFOLDING_JSON,
    "wheat": DROP_NO_SCAFFOLDING_JSON,
    "white_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "white_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "white_tulip": DROP_NO_SCAFFOLDING_JSON,
    "wither_rose": DROP_NO_SCAFFOLDING_JSON,
    "wither_skeleton_skull": DROP_NO_SCAFFOLDING_JSON,
    "yellow_stained_glass": DROP_NO_SCAFFOLDING_JSON,
    "yellow_stained_glass_pane": DROP_NO_SCAFFOLDING_JSON,
    "zombie_head": DROP_NO_SCAFFOLDING_JSON,
}

#dir_contents = next(os.walk("datapacks/Its-Mine/data/moesh/loot_tables/blocks/"))
dir_contents = next(os.walk("."))
files = dir_contents[2]

for file in files:
    if not file.endswith(".json"):
        continue

    print(file)
    block = file[0:-5]

    with open(file, "w") as output:
        loot_table_contents = LOOT_TABLES.get(block, DROP_SCAFFOLDING_JSON)
        output.write(loot_table_contents)

        