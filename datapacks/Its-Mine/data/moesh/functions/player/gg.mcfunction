# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Let a player quit the game early.
#---------------------------------------------------------------------------------------------------

# Place them in spectator and advise the players
execute as @s at @s run function moesh:player/spectate
execute if entity @a[team=players,gamemode=!spectator] run tellraw @a {"translate":">>> %s forfeited. They have been removed from the match.","with":[{"selector":"@s"}]}
execute unless entity @a[team=players,gamemode=!spectator] run tellraw @a {"translate":">>> %s forfeited. The match is over.","with":[{"selector":"@s"}]}

# Reset gg trigger
scoreboard players reset @a[scores={gg=1..}] gg
execute unless entity @a[team=players] run function moesh:game/end_match
