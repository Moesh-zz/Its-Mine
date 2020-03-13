# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Register the player on all the scoreboard they need. Enable triggers and set default
#---------------------------------------------------------------------------------------------------

# Always set

# Enable if the match is in lobby mode
execute if score GameState gameVariable matches 0 run scoreboard players reset @s startRound
execute if score GameState gameVariable matches 0 run scoreboard players enable @s startRound

# Enable if the match is in progress
execute if score GameState gameVariable matches 1 run scoreboard players reset @s gg
execute if score GameState gameVariable matches 1 run scoreboard players enable @s gg

# Enable if match
execute if score GameState gameVariable matches 2 run scoreboard players reset @s reset
execute if score GameState gameVariable matches 2 run scoreboard players enable @s reset