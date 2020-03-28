
# I want all players to be reset when we re-register
tag @a remove Registered

gamemode creative @a

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Testing environment set-up [remove file before launch]","color":"light_purple"}]}