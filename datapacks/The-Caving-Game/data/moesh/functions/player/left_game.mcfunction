#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Player has left the game and their matchID does not match the current one. Let's reset them.
execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 0 run tag @s remove Registered

# If a match is in-progress, advise the players that the joining player has been made a spectator.
execute unless score @s matchID = MatchID gameVariable if score GameState gameVariable matches 1 run tellraw @a {"translate":"%s %s has been moved to the sidelines. Nothing has been affected. The match continues!","color":"green","with":[{"text":">>>","color":"white"},{"selector":"@s"}]}
execute unless score @s matchID = MatchID gameVariable run scoreboard players set @s matchID 0
execute unless score @s matchID = MatchID gameVariable run scoreboard players set @s leaveGame 0