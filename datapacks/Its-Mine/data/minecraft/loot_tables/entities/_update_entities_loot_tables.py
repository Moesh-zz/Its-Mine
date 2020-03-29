import os

DROP_NOTHING = """{
    "type": "minecraft:entity",
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

DROP_USEFUL_ITEMS = """{
    "type": "minecraft:entity",
    "pools": [
        {
        "rolls": 1,
        "entries": [
            {
            "type": "minecraft:loot_table",
            "name": "moesh:gameplay/drop_useful_items"
            }
        ]
        }
    ]
}"""



# This is the brain of the operation. This table will indicate what block drops should have ores,
# and then we specify what drops nothing. Any block not mentioned here drops scaffolding. This
# list is ALWAYS first updated in _DROPS.md, and then copied over here.
LOOT_TABLES = {
    "blaze": DROP_USEFUL_ITEMS,
    "cave_spider": DROP_USEFUL_ITEMS,
    "creeper": DROP_USEFUL_ITEMS,
    "drowned": DROP_USEFUL_ITEMS,
    "elder_guardian": DROP_USEFUL_ITEMS,
    "enderman": DROP_USEFUL_ITEMS,
    "endermite": DROP_USEFUL_ITEMS,
    "ender_dragon": DROP_USEFUL_ITEMS,
    "evoker": DROP_USEFUL_ITEMS,
    "fox": DROP_USEFUL_ITEMS,
    "ghast": DROP_USEFUL_ITEMS,
    "guardian": DROP_USEFUL_ITEMS,
    "husk": DROP_USEFUL_ITEMS,
    "illusioner": DROP_USEFUL_ITEMS,
    "iron_golem": DROP_USEFUL_ITEMS,
    "magma_cube": DROP_USEFUL_ITEMS,
    "panda": DROP_USEFUL_ITEMS,
    "phantom": DROP_USEFUL_ITEMS,
    "pillager": DROP_USEFUL_ITEMS,
    "ravager": DROP_USEFUL_ITEMS,
    "shulker": DROP_USEFUL_ITEMS,
    "silverfish": DROP_USEFUL_ITEMS,
    "skeleton": DROP_USEFUL_ITEMS,
    "skeleton_horse": DROP_USEFUL_ITEMS,
    "spider": DROP_USEFUL_ITEMS,
    "slime": DROP_USEFUL_ITEMS,
    "snow_golem": DROP_USEFUL_ITEMS,
    "stray": DROP_USEFUL_ITEMS,
    "llama": DROP_USEFUL_ITEMS,
    "vex": DROP_USEFUL_ITEMS,
    "vindicator": DROP_USEFUL_ITEMS,
    "witch": DROP_USEFUL_ITEMS,
    "wither": DROP_USEFUL_ITEMS,
    "wither_skeleton": DROP_USEFUL_ITEMS,
    "wolf": DROP_USEFUL_ITEMS,
    "zombie": DROP_USEFUL_ITEMS,
    "zombie_pigman": DROP_USEFUL_ITEMS,
    "zombie_villager": DROP_USEFUL_ITEMS,
 
    "trader_llama": DROP_NOTHING,
    "giant": DROP_NOTHING,
    "armor_stand": DROP_NOTHING,
    "bat": DROP_NOTHING,
    "bee": DROP_NOTHING,
    "cat": DROP_NOTHING,
    "chicken": DROP_NOTHING,
    "cod": DROP_NOTHING,
    "cow": DROP_NOTHING,
    "dolphin": DROP_NOTHING,
    "donkey": DROP_NOTHING,
    "horse": DROP_NOTHING,
    "mooshroom": DROP_NOTHING,
    "mule": DROP_NOTHING,
    "ocelot": DROP_NOTHING,
    "parrot": DROP_NOTHING,
    "pig": DROP_NOTHING,
    "player": DROP_NOTHING,
    "polar_bear": DROP_NOTHING,
    "pufferfish": DROP_NOTHING,
    "rabbit": DROP_NOTHING,
    "salmon": DROP_NOTHING,
    "sheep": DROP_NOTHING,
    "squid": DROP_NOTHING,
    "tropical_fish": DROP_NOTHING,
    "turtle": DROP_NOTHING,
    "villager": DROP_NOTHING,
    "wandering_trader": DROP_NOTHING,
    "zombie_horse": DROP_NOTHING,
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
        loot_table_contents = LOOT_TABLES.get(block, DROP_USEFUL_ITEMS)
        output.write(loot_table_contents)

        