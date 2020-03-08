#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Clear player of their blessings.
clear @s
effect clear @s
xp set @s 0 levels
xp set @s 0 points

# Register the player on the health scoreboard
effect give @s minecraft:absorption 3 4 false
# Refill stats
effect give @s minecraft:instant_health 3 10 true
effect give @s minecraft:saturation 5 10 true

# Set players gamemode
# Game is in lobby mode
execute if score GameState gameVariable matches 0 run gamemode adventure @s
execute if score GameState gameVariable matches 0 run scoreboard players enable @s spectate
execute if score GameState gameVariable matches 0 run scoreboard players set @s spectate 0
# Game is in-progress
execute if score GameState gameVariable matches 1 run gamemode spectator @s
# Game is post-match
execute if score GameState gameVariable matches 2 run gamemode spectator @s