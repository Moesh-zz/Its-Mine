# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to start the game, let them.
#---------------------------------------------------------------------------------------------------
# This variable tracks whether or not a 
# the countdown! This state exists so 
scoreboard players set StartingRound gameVariable 1
# Stop players from using startRound trigger
scoreboard players reset * startRound

# TODO: Remove after testing
scoreboard objectives setdisplay sidebar gameVariable