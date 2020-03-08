#---------------------------------------------------------------------------------------------------
# Purpose: Reset the map and player states to neutral
#---------------------------------------------------------------------------------------------------
scoreboard players operation Blue objectiveTime = ObjectiveMax gameVariable
scoreboard players operation Red objectiveTime = ObjectiveMax gameVariable

# Set map rules
difficulty normal
time set 0
gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule doInsomnia true
# Can we make the sky go funny for a second?
weather rain
weather clear
gamerule showDeathMessages true
gamerule announceAdvancements true
gamerule doFireTick true
gamerule doMobSpawning true
gamerule mobGriefing true

# Reset scoreboard
scoreboard players reset @a kills
scoreboard players set @a[team=blue] kills 0
scoreboard players set @a[team=red] kills 0

# Make sure, JUST IN CASE, EXTRA SURE, SUPER SURE THAT THE $#%#$ bossbar loads correctly.
bossbar set minecraft:blue players @a
bossbar set minecraft:red players @a

# Set map rules and clean-up
# Kill all non-player, non-villager entities
execute as @e[type=!player,type=!villager] run tp ~ 0 ~
execute as @e[type=!player,type=!villager] run kill @s

scoreboard players reset @a[team=] kills
scoreboard players set @a kills 0
scoreboard players set @a deaths 0

scoreboard players operation Blue objectiveTime = ObjectiveMax gameVariable
scoreboard players operation Red objectiveTime = ObjectiveMax gameVariable

# If a player used a legacy reset, let's ensure they can no longer do this during the game!
scoreboard players reset * reset

# Purpose: Establish a SessionID by using gametime

execute store result score MatchID gameVariable run time query gametime
scoreboard players operation @a[team=red] matchID = MatchID gameVariable
scoreboard players operation @a[team=blue] matchID = MatchID gameVariable

#---------------------------------------------------------------------------------------------------
# Purpose: Let them out!
#---------------------------------------------------------------------------------------------------
spawnpoint @a[team=blue] 214 99 175
spawnpoint @a[team=red] 214 99 213

tp @a[team=blue] 214 99 175
tp @a[team=red] 214 99 213

# Lower red gates
fill 215 97 210 215 97 217 minecraft:stone
# Lower blue gates
fill 215 97 171 215 97 178 minecraft:stone

# Get rid of levers to prevent recursion on game end
setblock 214 100 217 minecraft:air
setblock 214 100 171 minecraft:air


# Run on all players
effect clear @a
clear @a
effect give @a minecraft:regeneration 5 10
effect give @a minecraft:saturation 5 10

# Send tellraw BEFORE changing any game modes!
tellraw @a {"translate":"%s VIVA LA REVOLUTION!","color":"green","with":[{"text":">>>","color":"white"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999

# Set gamemodes
gamemode spectator @a[team=]
gamemode survival @a[team=red]
gamemode survival @a[team=blue]

# Block off spawn so players can't escape into the lobby
# I struggled making the decision to add a bunch of bedrock to the spawn location. I eventually
# decided it is better to remove all doubt off whether or not the players can access a location
# simply because they can get to it. It kind of looks bad though. Whatever. It fulfills a very
# important function, and does it quickly.

# Blue
fill 212 99 179 212 102 171 minecraft:bedrock
fill 213 99 179 214 102 179 minecraft:bedrock
fill 213 102 178 214 102 171 minecraft:bedrock

# Red
fill 213 99 209 214 102 209 minecraft:bedrock
fill 212 99 209 212 102 217 minecraft:bedrock
fill 214 102 210 213 102 217 minecraft:bedrock

scoreboard players reset @a teamSelected
scoreboard players reset @a reset

#
scoreboard players enable @a[team=red] gg
scoreboard players enable @a[team=blue] gg

#---------------------------------------------------------------------------------------------------
# Purpose: The game is now in progress, update the variable
#---------------------------------------------------------------------------------------------------
scoreboard players set GameState gameVariable 1