# Called from: #moesh:load

#---------------------------------------------------------------------------------------------------
# Purpose: Set game specific variables
#---------------------------------------------------------------------------------------------------

# Define variables needed for this specific game. I've broken this out into its own file to make it
# easier to understand what scoreboard objectives are levels to be modified, and what objectives
# make up the logistical support.

# SET GAME VARIABLES
scoreboard objectives remove gameVariable
scoreboard objectives add gameVariable dummy
	# Index:
	# 0 = Lobby
	# 1 = In-progress
	# 2 = Post game
	# Game starts in lobby mode by default.
	scoreboard players set GameState gameVariable 0
	
    # 15 seconds countdown
	scoreboard players set TimeToStartMatch gameVariable 300
	# Match should match for 10 minutes
    scoreboard players set TimeToEndMatch gameVariable 12000
	
    # Used to determine whether or not the game has started.
    # This variable is accessed from moesh:tick, moesh:lobby/start_match,
    # moesh:lobby/trigger_cancel_start, and moesh:lobby/trigger_start_match
	scoreboard players set StartingMatch gameVariable 0

    # Set-up ore values
	scoreboard players set #Coal gameVariable 1
	scoreboard players set #IronIngot gameVariable 2
	scoreboard players set #GoldIngot gameVariable 22
	scoreboard players set #Redstone gameVariable 8
	scoreboard players set #Diamond gameVariable 62
	scoreboard players set #Emerald gameVariable 127
	scoreboard players set #LapisLazuli gameVariable 56

tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Game-specific variables set","color":"light_purple"}]}