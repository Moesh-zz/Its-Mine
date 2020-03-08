#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Control where commands output and how
gamerule commandBlockOutput false
gamerule logAdminCommands false
gamerule sendCommandFeedback true

# Set specific rules for this map
gamerule doDaylightCycle false
gamerule keepInventory false
gamerule doTileDrops true
gamerule doWeatherCycle false
weather clear 1000000
gamerule showDeathMessages true
gamerule naturalRegeneration true

# Other gamerules 
gamerule doImmediateRespawn false
gamerule disableRaids true
gamerule doInsomnia false
gamerule doLimitedCrafting false
gamerule announceAdvancements false
gamerule doEntityDrops true
gamerule doFireTick true
gamerule doMobLoot true
gamerule doMobSpawning false
gamerule mobGriefing false

# Probably never needs to change
gamerule maxCommandChainLength 65536
gamerule maxEntityCramming 0
gamerule randomTickSpeed 10
gamerule reducedDebugInfo false
gamerule disableElytraMovementCheck true
gamerule spectatorsGenerateChunks false
gamerule spawnRadius 7

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up bossbars
#---------------------------------------------------------------------------------------------------
# Remove old bossbars
bossbar remove blue
bossbar remove red

# Set fake players needed for setting bossbar from gameVariable settings
scoreboard players operation #InSeconds gameVariable = ObjectiveMax gameVariable
scoreboard players operation #InSeconds gameVariable /= TWENTY CONST

# NOTE: notched_ type bossbars are messed up. The second one displays incorrectly. File or find a bug?
bossbar add blue {"text":"Blue","color":"blue"}
	bossbar set blue color blue
	bossbar set blue name {"text":"Blue"}
	bossbar set blue style progress
	bossbar set blue visible true
	bossbar set minecraft:blue players @a
	# Set score based on gameVariables scoreboard (defaults set above)
	execute store result bossbar minecraft:blue max run scoreboard players get #InSeconds gameVariable
	execute store result bossbar minecraft:blue value run scoreboard players get #InSeconds gameVariable

bossbar add red {"text":"Red","color":"red"}
	bossbar set red color red
	bossbar set red name {"text":"Red"}
	bossbar set red style progress
	bossbar set red visible true
	bossbar set minecraft:red players @a
	# Set score based on gameVariables scoreboard (defaults set above)
	execute store result bossbar minecraft:red max run scoreboard players get #InSeconds gameVariable
	execute store result bossbar minecraft:red value run scoreboard players get #InSeconds gameVariable

scoreboard players set BlueReady gameVariable 0
scoreboard players set RedReady gameVariable 0

#---------------------------------------------------------------------------------------------------
# Purpose: Run follow-up functions to handle players currently in-game
#---------------------------------------------------------------------------------------------------
tag @a remove Registered
team leave @a

scoreboard players set GameState gameVariable 0
scoreboard players reset @a reset

# Submitted for the approval of the Midnight Society...
time set midnight

