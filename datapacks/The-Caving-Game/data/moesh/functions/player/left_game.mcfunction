# Make sure, JUST IN CASE, EXTRA SURE, SUPER SURE THAT THE $#%#$ bossbar loads correctly.
bossbar set minecraft:blue players @a
bossbar set minecraft:red players @a

execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 0 run tag @s remove Registered

execute unless score @s matchID = MatchID gameVariable run clear @s
execute unless score @s matchID = MatchID gameVariable run effect clear @s
execute unless score @s matchID = MatchID gameVariable run team leave @s
execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 0 run tp @s 203 99 194 -90 0 
execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 0 run spawnpoint @s 203 99 194

# Lobby session is running and they've joined late.
execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 0 run gamemode adventure @s
# A game is running, let's handle them different.
execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 1.. run gamemode spectator @s

execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 1 run tellraw @a {"translate":"%s %s has been moved to the sidelines. Nothing has been affected. The match continues!","color":"green","with":[{"text":">>>","color":"white"},{"selector":"@s"}]}
execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 1 run tellraw @s {"text":"You've become a relic of another time.","italic":true,"color":"gray"}
execute unless score @s matchID = MatchID gameVariable run scoreboard players set @s matchID 0
execute unless score @s matchID = MatchID gameVariable run scoreboard players set @s leaveGame 0