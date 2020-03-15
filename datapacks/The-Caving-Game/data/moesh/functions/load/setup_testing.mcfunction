
# I want all players to be reset when we re-register
tag @a remove Registered


# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Testing setup [REMOVE BEFORE LAUNCHING]","color":"green"}]}