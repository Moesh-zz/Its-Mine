# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Summon the trader and llamas
#---------------------------------------------------------------------------------------------------

summon minecraft:wandering_trader ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,CustomNameVisible:1b,CustomName:'{"translate":"Spenazuma","color":"gold"}'}
summon minecraft:trader_llama ~1 ~ ~-1 {NoGravity:1b,Invulnerable:1b,Glowing:1b,CustomNameVisible:1b,CustomName:'{"translate":"Evangeline","color":"gold"}'}
summon minecraft:trader_llama ~-1 ~ ~-1 {NoGravity:1b,Invulnerable:1b,Glowing:1b,CustomNameVisible:1b,CustomName:'{"translate":"Gabriel","color":"gold"}'}