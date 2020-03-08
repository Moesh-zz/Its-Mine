#---------------------------------------------------------------------------------------------------
# Purpose: Set-up teams
#---------------------------------------------------------------------------------------------------
team remove blue
team add blue {"text":"Blue","color":"blue"}
	team modify blue collisionRule pushOtherTeams
	team modify blue deathMessageVisibility always
	team modify blue nametagVisibility always
	team modify blue friendlyFire false
	team modify blue seeFriendlyInvisibles true
	team modify blue color blue

team remove players
team add players {"text":"players","color":"players"}
	team modify players collisionRule pushOtherTeams
	team modify players deathMessageVisibility always
	team modify players nametagVisibility always
	team modify players friendlyFire false
	team modify players seeFriendlyInvisibles true
	team modify players color players

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up objectives
#---------------------------------------------------------------------------------------------------
# Variables and random stuff
scoreboard objectives remove CONST
scoreboard objectives add CONST dummy
	scoreboard players set TWENTY CONST 20

# SET GAME VARIABLES
scoreboard objectives remove gameVariable
scoreboard objectives add gameVariable dummy
	scoreboard players set ObjectiveMax gameVariable 1600
	scoreboard players set GameState gameVariable 0
		# 0 = not in-progress
		# 1 = in-progress
		# 2 = unused, usually "game ending stage"
	scoreboard players set Countdown gameVariable 300
	scoreboard players set playersReady gameVariable 0
	scoreboard players set BlueReady gameVariable 0
	scoreboard players set CheckTeamsReady gameVariable 0
	scoreboard players set BlueLeverState gameVariable 0
	scoreboard players set playersLeverState gameVariable 0

# Used in [game/objective/drain_<team name>]
scoreboard objectives remove objectiveTime
scoreboard objectives add objectiveTime dummy
	# Set objectives to this.
	scoreboard players operation Blue objectiveTime = ObjectiveMax gameVariable
	scoreboard players operation players objectiveTime = ObjectiveMax gameVariable

# Used in [lobby/team_selected]
scoreboard objectives remove teamSelected
scoreboard objectives add teamSelected trigger

# yCoord used to detect if spectators want to return [lobby/return_spectator]
scoreboard objectives remove yCoord
scoreboard objectives add yCoord dummy

# Players may disconnect and reconnect during matches, let's ensure they're in the right match.
scoreboard objectives remove matchID
scoreboard objectives add matchID dummy

# Player left game
scoreboard objectives remove leaveGame
scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game

# GG
scoreboard objectives remove gg
scoreboard objectives add gg trigger

# Health! Show below names!
scoreboard objectives remove health
scoreboard objectives add health health {"text":"❤","color":"players"}
	scoreboard objectives setdisplay belowName health

scoreboard objectives remove kills
scoreboard objectives add kills playerKillCount {"text":"Kills","color":"green"} 
	scoreboard objectives setdisplay sidebar kills

scoreboard objectives remove deaths
scoreboard objectives add deaths deathCount {"text":"Deaths","color":"green"}

scoreboard objectives remove reset
scoreboard objectives add reset trigger

tellraw @a {"text":"The stage has been set.","color":"light_purple"}