# Called from: minecraft:load

#---------------------------------------------------------------------------------------------------
# Purpose: Kill entities and items by teleporting them down to void and then killing them.
#---------------------------------------------------------------------------------------------------

# We're going to teleport entities down to void, let's make them not glow first.
execute as @e[type=!player] run data modify entity @s Glowing set value 0

# I guess players are essential, don't kill em.
tp @e[type=!player] ~ -50 ~
kill @e[type=!player]

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"All non-player entities cleared","color":"light_purple"}]}