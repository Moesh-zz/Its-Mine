# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to start the game, let them.
#---------------------------------------------------------------------------------------------------
# This variable tracks whether or not game is beginning.
scoreboard players set StartingRound gameVariable 1

# Start the timer from the beginning
scoreboard players operation TimeInTicks gameVariable = TimeToStartRound gameVariable

# Setup new triggers for the player
scoreboard players reset * startRound

# TODO: Remove after testing
scoreboard objectives setdisplay sidebar gameVariable