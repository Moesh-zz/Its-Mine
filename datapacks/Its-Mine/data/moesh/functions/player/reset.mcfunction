# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Clear player of their blessings.
clear @s minecraft:coal
clear @s minecraft:iron_ingot
clear @s minecraft:gold_ingot
clear @s minecraft:redstone
clear @s minecraft:diamond
clear @s minecraft:emerald
clear @s minecraft:lapis_lazuli
effect clear @s
xp set @s 0 levels
xp set @s 0 points

# Register the player on the health scoreboard
effect give @s minecraft:absorption 3 4 false
# Refill stats
effect give @s minecraft:instant_health 3 10 true
effect give @s minecraft:saturation 5 10 true

# Set players game mode
# Game is in lobby mode and make them join the right team
execute if score GameState gameVariable matches 0 run gamemode adventure @s
execute if score GameState gameVariable matches 0 run team join players @s
execute if score GameState gameVariable matches 0 run scoreboard players enable @s spectate
# Game is in-progress
execute if score GameState gameVariable matches 1 run gamemode spectator @s
execute if score GameState gameVariable matches 1 run team join specators @s
# Game is post-match
execute if score GameState gameVariable matches 2 run gamemode spectator @s