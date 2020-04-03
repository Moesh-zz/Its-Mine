# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions
#---------------------------------------------------------------------------------------------------

scoreboard objectives setdisplay sidebar displayScore

# Announce how many ores they have, and then calculate and display points.
tellraw @a {"translate":"%s has [Coal] * %s","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"Coal"}}]}
scoreboard players operation @s Coal *= #Coal gameVariable
scoreboard players operation @s displayScore = @s Coal

tellraw @a {"translate":"%s has [Iron Ingot] * %s","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"IronIngot"}}]}
scoreboard players operation @s IronIngot *= #IronIngot gameVariable
scoreboard players operation @s displayScore += @s IronIngot

tellraw @a {"translate":"%s has [Gold Ingot] * %s","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"GoldIngot"}}]}
scoreboard players operation @s GoldIngot *= #GoldIngot gameVariable
scoreboard players operation @s displayScore += @s GoldIngot


tellraw @a {"translate":"%s has [Redstone] * %s","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"Redstone"}}]}
scoreboard players operation @s Redstone *= #Redstone gameVariable
scoreboard players operation @s displayScore = @s Redstone

tellraw @a {"translate":"%s has [Diamond] * %s","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"Diamond"}}]}
scoreboard players operation @s Diamond *= #Diamond gameVariable
scoreboard players operation @s displayScore = @s Diamond

tellraw @a {"translate":"%s has [Emerald] * %s","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"Emerald"}}]}
scoreboard players operation @s Emerald *= #Emerald gameVariable
scoreboard players operation @s displayScore = @s Emerald

tellraw @a {"translate":"%s has [Lapis Lazuli] * %s","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"LapisLazuli"}}]}
scoreboard players operation @s LapisLazuli *= #LapisLazuli gameVariable
scoreboard players operation @s displayScore = @s LapisLazuli