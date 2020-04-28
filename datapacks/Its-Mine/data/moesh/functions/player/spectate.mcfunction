# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Register the player on all the scoreboard they need. Enable triggers and set default
#---------------------------------------------------------------------------------------------------

# Heal players so they don't die when losing health.
effect give @a minecraft:instant_health 5 30 false
clear @a minecraft:scaffolding
clear @a minecraft:torch

# Add them to spectator after healing them
gamemode spectator @s

# Specator's must always be on the spectator team, because I said so!
team join spectators @s