# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Reset the map and player states to neutral
#---------------------------------------------------------------------------------------------------
# Make the announcement
tellraw @a {"translate":">>> %s","color":"white","with":[{"text":"The match is over.","color":"green"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999 0.75
# Set gamestate to 2 (after game is finished)
scoreboard players set GameState gameVariable 2

function moesh:game/count_points

# All players become spectators!
gamemode spectator @a
team join specators @a

# The match has ended, let's updated the SessionID so players are properly handled
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a SessionID = SessionID gameVariable

# Allow players to reset the map themselves
tellraw @a {"translate":"Thanks for playing! Use [%s] to play again.","color":"green","with":[{"text":"/trigger reset set 1","color":"white","clickEvent":{"action":"suggest_command","value":"/trigger reset set 1"},"hoverEvent":{"action":"show_text","value":"Click here to send the command to your text box."}}]}

# Update player triggers
scoreboard players reset @a gg
scoreboard players enable @a reset

#---------------------------------------------------------------------------------------------------
# Purpose: Update game state
#---------------------------------------------------------------------------------------------------
scoreboard players set GameState gameVariable 2