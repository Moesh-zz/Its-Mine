# Called from: minecraft:load

#---------------------------------------------------------------------------------------------------
# Purpose: Kill entities and items by teleporting them down to void and then killing them.
#---------------------------------------------------------------------------------------------------

# Remove all entities and items
# I guess players and iron golems are essential...
tp @e[type=!player,type=!iron_golem] ~ 0 ~
kill @e[type=!player,type=!iron_golem]

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"All non-essential entities cleared.","color":"green"}]}
