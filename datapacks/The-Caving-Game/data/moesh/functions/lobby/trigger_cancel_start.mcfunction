# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Cancel the timer to start a round
#---------------------------------------------------------------------------------------------------
scoreboard players set StartingMatch gameVariable 0

# Setup new triggers for the player
scoreboard players reset * cancelStart
scoreboard players enable @a startMatch