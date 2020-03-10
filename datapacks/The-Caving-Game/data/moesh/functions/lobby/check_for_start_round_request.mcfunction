# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to start the game, let them.
#---------------------------------------------------------------------------------------------------

# This line below is for players who want to be cheeky. If they ever set a score for startRound,
# go ahead and assume they want to start the round. 
scoreboard players set @a[scores={startRound=..-1}] startRound 0
scoreboard players enable @a[scores={startRound=0}] startRound

execute if entity @a[scores={startRound=1}] run function moesh:lobby/countdown
scoreboard players reset @a[scores={startRound=1}] startRound