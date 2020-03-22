# Called from: minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Teleports dropped items back to their owner.
# Snippet from: https://gaming.stackexchange.com/a/354714
#---------------------------------------------------------------------------------------------------
# It is not likely the player will ever run out of inventory space. Players who fill up their whole
# inventory will likely be able to drop their pickaxe. We'll eventually have to add handling for
# this, but not at a prototype stage. I predict a tester will attempt this during the prototype
# stage and I'll get a bug report for it. Just watch.

# We're on a server, lag could be real. Let's prevent any other players from picking up our item.
execute as @e[type=minecraft:item] if data entity @s Thrower run data modify entity @s Owner.L set from entity @s Thrower.L
execute as @e[type=minecraft:item] if data entity @s Owner run data modify entity @s Owner.M set from entity @s Thrower.M
# The player has thrown an item, make them pick it up immediately.
execute as @e[type=minecraft:item] if data entity @s Thrower run data modify entity @s PickupDelay set value 0

# Just to be extra safe, let's match the UUIDs and continuously teleport these items to the player.
execute as @e[type=minecraft:item] if data entity @s Thrower store result score @s UUID run data get entity @s Thrower.M 0.0000000001
execute as @a store result score @s UUID run data get entity @s UUIDMost 0.0000000001
execute as @e[type=item] at @a if score @s UUID = @p UUID run tp ~ ~ ~