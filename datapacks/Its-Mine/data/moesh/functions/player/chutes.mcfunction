# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Give levitation to players who enter chutes when they are not shifting.
#---------------------------------------------------------------------------------------------------
# The most clean version of this mechanic can be done in two lines. This method of adding a layer
# of handling through a tag allows us to run multiple commands that can be ignored if the first
# command is not successful.

# Is the player in scaffolding and not sneaking? Shoot them up.
execute as @a[tag=!Levitate] at @s anchored feet if block ~ ~ ~ minecraft:scaffolding unless entity @s[scores={sneakTime=1..}] run tag @s add Levitate
execute as @a[tag=Levitate,scores={sneakTime=0}] at @s anchored feet if block ~ ~ ~ minecraft:scaffolding run effect give @s minecraft:levitation 3 23 false
# They've left scaffolding, stahp!
execute as @a[tag=Levitate] at @s anchored feet if block ~ ~ ~ minecraft:air run effect clear @s minecraft:levitation
execute as @a[tag=Levitate] at @s anchored feet if entity @s[scores={sneakTime=1..}] run effect clear @s minecraft:levitation
# Give them a cute little puff of air when they exit the scaffolding
execute as @a[tag=Levitate] at @s anchored feet if block ~ ~ ~ minecraft:air run particle minecraft:cloud ~ ~ ~ 0.5 0.1 0.5 0.1 200 force
execute as @a[tag=Levitate] at @s anchored feet if block ~ ~ ~ minecraft:air run tag @s remove Levitate

# sneakTime increments when a player is crouching (holding SHIFT), reset it after checking to see if
# player has crouched in the last tick.
scoreboard players set @a[scores={sneakTime=1..}] sneakTime 0