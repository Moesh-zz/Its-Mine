# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Clear player of their blessings.
clear @s minecraft:scaffolding
clear @s minecraft:torch
clear @s minecraft:ender_pearl
clear @s minecraft:cooked_salmon
clear @s minecraft:elytra
clear @s minecraft:firework_rocket

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
execute if score GameState gameVariable matches 0 as @s at @s run function moesh:player/set_to_lobby_mode

# Game is in-progress or post-match
execute if score GameState gameVariable matches 1..2 as @s at @s run function moesh:player/spectate