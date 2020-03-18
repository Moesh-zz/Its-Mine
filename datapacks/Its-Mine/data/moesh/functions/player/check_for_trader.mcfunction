# Called from: minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Take ores from players and keep track until the end of the game.
#---------------------------------------------------------------------------------------------------

# The player has been near a trader, but has moved away. Let's reset them.

# The player is near a trader
execute unless entity @e[type=minecraft:wandering_trader,distance=..2] run tag @s remove AlreadyTraded
execute if entity @e[type=minecraft:wandering_trader,distance=..2] run tag @s[tag=!AlreadyTraded] add WantsToTrade

# Execute some functions when the player is near the trader
execute if entity @s[tag=WantsToTrade] run function moesh:game/take_ores
# TODO: execute if entity @s[tag=WantsToTrade] run function moesh:game/refill_items_and_health

# The player has been near the trader, let's lock them out after this tick.
tag @s[tag=WantsToTrade,tag=!AlreadyTraded] add AlreadyTraded
# Let's assume the player 
tag @s[tag=WantsToTrade] remove WantsToTrade