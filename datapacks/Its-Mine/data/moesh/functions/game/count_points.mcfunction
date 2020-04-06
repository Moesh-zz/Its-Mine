# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions
#---------------------------------------------------------------------------------------------------

# Display the scoreboard
scoreboard objectives setdisplay sidebar Score

# Announce how many ores they have, and then calculate and display points.
scoreboard players operation @s oreValue = @s Coal
scoreboard players operation @s oreValue *= #Coal gameVariable
execute unless score @s oreValue matches 0 run tellraw @a {"translate":"%s has %s [Coal] (Valued at %s points)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"Coal"}},{"score":{"name":"@s","objective":"oreValue"}}]}
scoreboard players operation @s Score = @s oreValue

scoreboard players operation @s oreValue = @s IronIngot
scoreboard players operation @s oreValue *= #IronIngot gameVariable
execute unless score @s oreValue matches 0 run tellraw @a {"translate":"%s has %s [Iron Ingot] (Valued at %s points)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"IronIngot"}},{"score":{"name":"@s","objective":"oreValue"}}]}
scoreboard players operation @s Score += @s oreValue

scoreboard players operation @s oreValue = @s GoldIngot
scoreboard players operation @s oreValue *= #GoldIngot gameVariable
execute unless score @s oreValue matches 0 run tellraw @a {"translate":"%s has %s [Gold Ingot] (Valued at %s points)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"GoldIngot"}},{"score":{"name":"@s","objective":"oreValue"}}]}
scoreboard players operation @s Score += @s oreValue

scoreboard players operation @s oreValue = @s Redstone
scoreboard players operation @s oreValue *= #Redstone gameVariable
execute unless score @s oreValue matches 0 run tellraw @a {"translate":"%s has %s [Redstone] (Valued at %s points)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"Redstone"}},{"score":{"name":"@s","objective":"oreValue"}}]}
scoreboard players operation @s Score += @s oreValue

scoreboard players operation @s oreValue = @s Diamond
scoreboard players operation @s oreValue *= #Diamond gameVariable
execute unless score @s oreValue matches 0 run tellraw @a {"translate":"%s has %s [Diamond] (Valued at %s points)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"Diamond"}},{"score":{"name":"@s","objective":"oreValue"}}]}
scoreboard players operation @s Score += @s oreValue

scoreboard players operation @s oreValue = @s Emerald
scoreboard players operation @s oreValue *= #Emerald gameVariable
execute unless score @s oreValue matches 0 run tellraw @a {"translate":"%s has %s [Emerald] (Valued at %s points)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"Emerald"}},{"score":{"name":"@s","objective":"oreValue"}}]}
scoreboard players operation @s Score += @s oreValue

scoreboard players operation @s oreValue = @s LapisLazuli
scoreboard players operation @s oreValue *= #LapisLazuli gameVariable
execute unless score @s oreValue matches 0 run tellraw @a {"translate":"%s has %s [Lapis Lazuli] (Valued at %s points)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"LapisLazuli"}},{"score":{"name":"@s","objective":"oreValue"}}]}
scoreboard players operation @s Score += @s oreValue

# Determine the winner
scoreboard players operation @a testScore > @a Score
execute as @a at @s run scoreboard players operation @s testScore -= @s Score
execute as @s[scores={testScore=0}] run say Victory! It's mine!