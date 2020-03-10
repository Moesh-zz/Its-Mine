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
# If you're on this team, you are always in the spectator gamemode.
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
	scoreboard players set GameState gameVariable 0
		# 0 = not in-progress
		# 1 = in-progress
		# 2 = after game finished

# Players may disconnect and reconnect during matches, let's ensure they're in the right match.
scoreboard objectives remove matchID
scoreboard objectives add matchID dummy

scoreboard objectives remove leaveGame
scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game

# GG
scoreboard objectives remove gg
scoreboard objectives add gg trigger

scoreboard objectives remove reset
scoreboard objectives add reset trigger

# Let's alert the devs.
tellraw @a[gamemode=creative] {"text":">>> %s","color":"white","with":[{"text":"Teams and objectives reset"}]}