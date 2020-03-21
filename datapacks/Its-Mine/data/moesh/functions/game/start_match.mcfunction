# Called from: moesh:lobby/timer

#---------------------------------------------------------------------------------------------------
# Purpose: Reset the map and player states to neutral
#---------------------------------------------------------------------------------------------------
# Set map rules
difficulty normal
gamerule doInsomnia false
gamerule showDeathMessages true
gamerule announceAdvancements true
gamerule doFireTick true
gamerule doMobSpawning true
gamerule mobGriefing true

# Set map rules and clean-up
# Kill all non-player, non-villager entities
function moesh:load/clear_entities
function moesh:load/summon_trader_and_llamas

# Purpose: Establish a SessionID by using game time
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a SessionID = SessionID gameVariable

#---------------------------------------------------------------------------------------------------
# Purpose: Give players items and effects and let them play the game.
#---------------------------------------------------------------------------------------------------
# Send tellraw BEFORE changing any game modes!
tellraw @a {"translate":"%s Get the most ores to win!","color":"green","with":[{"text":">>>","color":"white"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999

# Clear the player's items and effects, refill their bars
function moesh:player/reset
gamemode survival @a[team=players]

# Update player triggers
scoreboard players reset * cancelStart
scoreboard players enable @a[team=players] gg

#---------------------------------------------------------------------------------------------------
# Purpose: Update game state
#---------------------------------------------------------------------------------------------------
# We're using the same variable to count time in ticks.
scoreboard players operation TimeInTicks gameVariable = TimeToEndMatch gameVariable

scoreboard players set StartingMatch gameVariable 0
scoreboard players set GameState gameVariable 1