# Called from: moesh:load/reset_entities

#---------------------------------------------------------------------------------------------------
# Purpose: Summon the trader and llamas
#---------------------------------------------------------------------------------------------------

summon minecraft:wandering_trader 136 3 136 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,PersistenceRequired:1b,NoAI:1b,Rotation:[-180F,0F],Offers:{}}
execute as @e[type=minecraft:wandering_trader] at @s run summon minecraft:trader_llama ~1 ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b}
execute as @e[type=minecraft:wandering_trader] at @s run summon minecraft:trader_llama ~-1 ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b}
