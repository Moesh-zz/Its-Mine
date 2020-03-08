# Load variables into the 
scoreboard players operation #InSeconds gameVariable = Countdown gameVariable
scoreboard players operation #Every20Ticks gameVariable = Countdown gameVariable
function rev:math/divide_by_twenty

execute if score #Every20Ticks gameVariable matches 0 run playsound minecraft:block.note_block.bit master @a 217 100 195 999999 0.7

# 15, 10, and 5 seconds
execute if score Countdown gameVariable matches 300 run tellraw @a {"translate":"%s Match begins in %s seconds","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score Countdown gameVariable matches 200 run tellraw @a {"translate":"%s Match begins in %s seconds","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score Countdown gameVariable matches 100 run tellraw @a {"translate":"%s Match begins in %s seconds","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}


# 4 seconds to 1 seconds...
execute if score Countdown gameVariable matches 80 run tellraw @a {"translate":"%s %s...","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score Countdown gameVariable matches 60 run tellraw @a {"translate":"%s %s...","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score Countdown gameVariable matches 40 run tellraw @a {"translate":"%s %s...","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score Countdown gameVariable matches 20 run tellraw @a {"translate":"%s %s...","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}

execute if score Countdown gameVariable matches 0 run function rev:game/start_round

# Tick down start-up timer (ticks)
execute if score Countdown gameVariable matches 1.. run scoreboard players remove Countdown gameVariable 1