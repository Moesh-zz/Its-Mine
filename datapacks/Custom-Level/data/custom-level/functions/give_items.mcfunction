# Called from moesh:player/refill_health_and_items

#---------------------------------------------------------------------------------------------------
# Purpose: Give players a different set of items when they enter the game, respawn after dying, or
# when they walk near a Wandering Trader.
#---------------------------------------------------------------------------------------------------

# A player will always receive:
    # Shield
    # Diamond Pickaxe
    # Feather Falling Boots

# Suggested items:
    # minecraft:torch
    # minecraft:cooked_salmon
    # minecraft:scaffolding
    # minecraft:ender_pearl
    # minecraft:elytra (using the replaceitem command, targetting @s)
    # minecraft:fireworks (for use with the elytra)

# Items are cleared and given back because players can gain more items then they receive from the
# Wandering Trader.

# Clear up to 8 torches and then them back.
clear @s minecraft:torch 4
give @s minecraft:torch 4

# Clear up to 32 scaffolding and then give them back
clear @s minecraft:scaffolding 16
give @s minecraft:scaffolding 16