tellraw @a {"translate":">>> %s","color":"white","with":[{"text":"The match is over.","color":"green"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999 0.75

gamemode spectator @a

# Set gamestate to 2 (after game is finished)
# I suppose I can use later use this to make a cool reset thing. (Spoiler alert: I did.)
scoreboard players set GameState gameVariable 2

execute store result score MatchID gameVariable run time query gametime
scoreboard players operation @a[team=red] matchID = MatchID gameVariable
scoreboard players operation @a[team=blue] matchID = MatchID gameVariable

# A bit of a hacky way to enable a map reset for all players.
# This method also allows me to do a legacy reset, allowing players to play the map without resetting
# the terrain. You know, for the sickos out there.
tellraw @a {"translate":"Thanks for playing! Use [%s] to play again.","color":"green","with":[{"text":"/trigger reset set 1","color":"white"}]}
scoreboard players set @a reset 0
scoreboard players enable @a reset
scoreboard players reset @a gg