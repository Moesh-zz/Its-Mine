# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Summon the trader and llamas
#---------------------------------------------------------------------------------------------------

summon minecraft:wandering_trader 136 3 136 {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,CustomNameVisible:1b,Team:"traders",PersistenceRequired:1b,NoAI:1b,Rotation:[-180F,0F],Offers:{}}
execute as @e[type=minecraft:wandering_trader] at @s run summon minecraft:trader_llama ~1 ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,CustomNameVisible:1b,Team:"traders"}
execute as @e[type=minecraft:wandering_trader] at @s run summon minecraft:trader_llama ~-1 ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,CustomNameVisible:1b,Team:"traders"}

team join traders @e[type=minecraft:wandering_trader]

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Wandering Trader and Trader Llamas summoned","color":"light_purple"}]}