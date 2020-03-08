clear @s
effect clear @s
effect give @s minecraft:absorption 3 4 false
effect give @s minecraft:instant_health 3 10 true
effect give @s minecraft:saturation 5 10 true
xp set @s 0 levels
xp set @s 0 points

tp @s 203 99 194 -90 0 
gamemode adventure @s
spawnpoint @s 203 99 194

bossbar set minecraft:blue players @a
bossbar set minecraft:red players @a

# game in progress
execute if score GameState gameVariable matches 1 run gamemode spectator @s

# pre-game
execute if score GameState gameVariable matches 0 run gamemode adventure @s
execute if score GameState gameVariable matches 0 run scoreboard players enable @s teamSelected
execute if score GameState gameVariable matches 0 run scoreboard players enable @s spectate
execute if score GameState gameVariable matches 0 run scoreboard players set @s teamSelected 0
execute if score GameState gameVariable matches 0 run scoreboard players set @s spectate 0

scoreboard players set @s kills 0
scoreboard players set @s deaths 0

tellraw @a[tag=!Registered] {"text":"Welcome to (the) Revolution!","color":"green"}

tag @s add Registered