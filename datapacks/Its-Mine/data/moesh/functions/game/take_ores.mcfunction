# Called from: minecraft:game/trader/check_for_nearby_players

#---------------------------------------------------------------------------------------------------
# Purpose: Take ores from players and keep track until the end of the game.
#---------------------------------------------------------------------------------------------------

# Reset variable, just in case.
scoreboard players set #ClearedOre gameVariable 0
# Clear the ore and store the results, then add it to permanent holding.
execute store result score #ClearedOre gameVariable run clear @s minecraft:coal
scoreboard players operation @s Coal += #ClearedOre gameVariable
execute store result score #ClearedOre gameVariable run clear @s minecraft:iron_ingot
scoreboard players operation @s IronIngot += #ClearedOre gameVariable
execute store result score #ClearedOre gameVariable run clear @s minecraft:gold_ingot
scoreboard players operation @s GoldIngot += #ClearedOre gameVariable
execute store result score #ClearedOre gameVariable run clear @s minecraft:redstone
scoreboard players operation @s Redstone += #ClearedOre gameVariable
execute store result score #ClearedOre gameVariable run clear @s minecraft:diamond
scoreboard players operation @s Diamond += #ClearedOre gameVariable
execute store result score #ClearedOre gameVariable run clear @s minecraft:emerald
scoreboard players operation @s Emerald += #ClearedOre gameVariable
execute store result score #ClearedOre gameVariable run clear @s minecraft:lapis_lazuli
scoreboard players operation @s LapisLazuli += #ClearedOre gameVariable

#scoreboard players 
say Ores taken!
