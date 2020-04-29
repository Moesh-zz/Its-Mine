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
team add spectators {"text":"Spectators"}
# If you're on this team, you are always in the spectator game mode.
	team modify spectators collisionRule pushOtherTeams
	team modify spectators deathMessageVisibility never
	team modify spectators seeFriendlyInvisibles false
	team modify spectators color gray

team remove traders
team add traders {"text":"Traders"}
	team modify traders collisionRule never
	team modify traders deathMessageVisibility always
	team modify traders color green

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up objectives
#---------------------------------------------------------------------------------------------------
# Variables and random stuff
scoreboard objectives remove CONST
scoreboard objectives add CONST dummy
	scoreboard players set 20 CONST 20
	scoreboard players set 60 CONST 60

# We must keep track of all different kinds of scores for players.
scoreboard objectives remove Coal
scoreboard objectives add Coal dummy
scoreboard objectives remove IronIngot
scoreboard objectives add IronIngot dummy
scoreboard objectives remove GoldIngot
scoreboard objectives add GoldIngot dummy
scoreboard objectives remove Redstone
scoreboard objectives add Redstone dummy
scoreboard objectives remove Diamond
scoreboard objectives add Diamond dummy
scoreboard objectives remove Emerald
scoreboard objectives add Emerald dummy
scoreboard objectives remove LapisLazuli
scoreboard objectives add LapisLazuli dummy

scoreboard objectives remove oreValue
scoreboard objectives add oreValue dummy

scoreboard objectives remove testScore
scoreboard objectives add testScore dummy

# Display score
scoreboard objectives remove Score
scoreboard objectives add Score dummy {"translate":"Score","color":"green"}

# WHEN DOES THE PLAYER SNEAK?!
scoreboard objectives remove sneakTime
scoreboard objectives add sneakTime minecraft.custom:minecraft.sneak_time

# Players may disconnect and reconnect during matches, let's ensure they're in the right match.
scoreboard objectives remove SessionID
scoreboard objectives add SessionID dummy
# Minecraft will tick this up when a player disconnects from the game.
scoreboard objectives remove leaveGame
scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game

# UUID = Universally Unique Identifier. Entities have these for...identification.
# Check out https://www.uuidgenerator.net/version4 for more information. Use UUID4.
scoreboard objectives remove UUID
scoreboard objectives add UUID dummy

# Player triggers
# These are ALWAYS reset when they are enabled. Players have no score by default.
# Enabled during the match. Players are moved to spectator if they want to gg out early.
scoreboard objectives remove gg
scoreboard objectives add gg trigger
# Players can use this to reset the level after a match has concluded.
scoreboard objectives remove reset
scoreboard objectives add reset trigger
# Start match
scoreboard objectives remove startMatch
scoreboard objectives add startMatch trigger
# Cancel start 
scoreboard objectives remove cancelStart
scoreboard objectives add cancelStart trigger

# In Scaffolding, used in moesh:player/chutes_and_runways
scoreboard objectives remove inScaffolding
scoreboard objectives add inScaffolding dummy

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Teams and objectives removed and reset","color":"light_purple"}]}