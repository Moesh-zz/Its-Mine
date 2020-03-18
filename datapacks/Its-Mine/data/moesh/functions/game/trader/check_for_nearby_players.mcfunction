# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: 
#---------------------------------------------------------------------------------------------------

# If player leaves the trader's radius, remove their LockedOut tag
execute as @e[type=minecraft:wandering_trader] run tag @a[distance=2..,tag=LockedOut] remove LockedOut
# Check for new players near trader
execute as @e[type=minecraft:wandering_trader] run tag @a[team=players,distance=..2,tag=!LockedOut] add NearTrader
execute as @e[type=minecraft:wandering_trader] run tag @a[team=players,tag=NearTrader] remove NearTrader

# TODO: Act on this new fact.
execute as @a[tag=NearTrader] at @s run function moesh:game/trader/take_ores

# Player is already near trader, lock them out
tag @a[tag=NearTrader] add LockedOut
tag @a[tag=NearTrader] remove NearTrader