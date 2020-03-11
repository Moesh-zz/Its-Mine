# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Reset the map and player states to neutral
#---------------------------------------------------------------------------------------------------
# Make the announcement
tellraw @a {"translate":">>> %s","color":"white","with":[{"text":"The match is over.","color":"green"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999 0.75
# Set gamestate to 2 (after game is finished)
scoreboard players set GameState gameVariable 2

# All players become spectators!
gamemode spectator @a

# Players cannot GG after the round has ended
scoreboard players reset @a gg

# The match has ended, let's updated the MatchID so players are properly handled
execute store result score MatchID gameVariable run time query gametime
scoreboard players operation @a matchID = MatchID gameVariable

# A bit of a hacky way to enable a map reset for all players.
# This method also allows me to do a legacy reset, allowing players to play the map without resetting
# the terrain. You know, for the sickos out there.
tellraw @a {"translate":"Thanks for playing! Use [%s] to play again.","color":"green","with":[{"text":"/trigger reset set 1","color":"white"}]}
scoreboard players set @a reset 0
scoreboard players enable @a reset

#---------------------------------------------------------------------------------------------------
# Purpose: Update game state
#---------------------------------------------------------------------------------------------------
scoreboard players set GameState gameVariable 2