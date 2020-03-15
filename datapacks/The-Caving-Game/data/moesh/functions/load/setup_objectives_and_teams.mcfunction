# Called from: minecraft:load

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up teams
#---------------------------------------------------------------------------------------------------
team remove players
team add players {"text":"Players"}
	team modify players collisionRule pushOtherTeams
	team modify players deathMessageVisibility never
	team modify players nametagVisibility never
	team modify players friendlyFire true
	team modify players seeFriendlyInvisibles true

team remove spectators
team add spectators {"text":"Spectators","color":"gray"}
# If you're on this team, you are always in the spectator game mode.
	team modify spectators collisionRule pushOtherTeams
	team modify spectators deathMessageVisibility never
	team modify spectators seeFriendlyInvisibles false
	team modify spectators color gray

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up objectives
#---------------------------------------------------------------------------------------------------
# Variables and random stuff
scoreboard objectives remove CONST
scoreboard objectives add CONST dummy
	scoreboard players set 20 CONST 20
	scoreboard players set 60 CONST 60

# SET GAME VARIABLES
scoreboard objectives remove gameVariable
scoreboard objectives add gameVariable dummy
	# Index:
	# 0 = Lobby
	# 1 = In-progress
	# 2 = Post game
	# Game starts in lobby mode by default.
	scoreboard players set GameState gameVariable 0
	# 15 seconds until game
	scoreboard players set TimeToStartMatch gameVariable 300
	scoreboard players set TimeToEndMatch gameVariable 12000
	# The round is no longer starting. It started.
	scoreboard players set StartingMatch gameVariable 0
	# We want to be able to set variables from one location instead of multiple.
	scoreboard players operation TimeInTicks gameVariable = TimeToStartMatch gameVariable

# Players may disconnect and reconnect during matches, let's ensure they're in the right match.
scoreboard objectives remove SessionID
scoreboard objectives add SessionID dummy
# Minecraft will tick this up when a player disconnects from the game.
scoreboard objectives remove leaveGame
scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game

# Player triggers
# These are ALWAYS reset when they are enabled. Players have no score by default.
# Enabled during the match. Players are moved to spectator if they want to gg out early.
scoreboard objectives remove gg
scoreboard objectives add gg trigger
# Players can use this to reset the level after a match has conclused.
scoreboard objectives remove reset
scoreboard objectives add reset trigger
# Start match
scoreboard objectives remove startMatch
scoreboard objectives add startMatch trigger
# Cancel start 
scoreboard objectives remove cancelStart
scoreboard objectives add cancelStart trigger

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Teams and objectives reset","color":"green"}]}