# Called from: #moesh:load

#---------------------------------------------------------------------------------------------------
# Purpose: Kill entities and items by teleporting them down to void and then killing them.
#---------------------------------------------------------------------------------------------------

# We're going to teleport entities down to void, let's make them not glow first.
execute as @e[type=!player] run data modify entity @s Glowing set value 0

# I guess players are essential, don't kill em.
execute as @e[type=!player] at @s run tp ~ -50 ~
execute as @e[type=!player] at @s run kill @s[type=!player]

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"All non-player entities cleared","color":"light_purple"}]}

#---------------------------------------------------------------------------------------------------
# Purpose: Summon the trader and llamas
#---------------------------------------------------------------------------------------------------

summon minecraft:wandering_trader 136 3 136 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,PersistenceRequired:1b,NoAI:1b,Rotation:[-180F,0F],Offers:{}}
execute as @e[type=minecraft:wandering_trader] at @s run summon minecraft:trader_llama ~1 ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b}
execute as @e[type=minecraft:wandering_trader] at @s run summon minecraft:trader_llama ~-1 ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b}

# Entities cannot be made to glow a certain color as they spawn in. They must first spawn, then be
# made to glow one tick afterwards.
schedule function moesh:load/make_traders_glow 1t

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Wandering Trader and Trader Llamas summoned","color":"light_purple"}]}