# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------

# This line below is for players who want to be cheeky. If they ever set a score for startRound,
# go ahead and assume they want to start the round. 
scoreboard players set @a[scores={startRound=..-1}] startRound 0
scoreboard players enable @a[scores={startRound=0}] startRound

# If a game is not starting, check to see if players want to start a game
execute as @a[scores={startRound=1..}] at @s if score PlayersAreReady gameVariable matches 0 run function moesh:lobby/trigger_start_round

# If a game start is happening, check to see if players want to cancel it
#execute if score PlayersAreReady gameVariable matches 1 run function moesh:lobby/trigger_cancel_start

# Tick this every second if players will it.
execute if score PlayersAreReady gameVariable matches 1 run function moesh:lobby/countdown