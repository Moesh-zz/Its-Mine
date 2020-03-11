# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to start the game, let them.
#---------------------------------------------------------------------------------------------------


tellraw @a {"translate":">>> %s","color":"white","with":[{"translate":"The match begins!","color":"green"}]}
scoreboard players set PlayersAreReady gameVariable 1
scoreboard players reset * startRound

scoreboard objectives setdisplay sidebar gameVariable