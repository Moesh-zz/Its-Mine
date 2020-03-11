

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------
# Tick timer down
scoreboard players remove TimeInTicks gameVariable 1

#
scoreboard players operation #InSeconds gameVariable = TimeInTicks gameVariable
scoreboard players operation #InSeconds gameVariable /= 20 CONST
scoreboard players operation #Every20Ticks gameVariable = TimeInTicks gameVariable
scoreboard players operation #Every20Ticks gameVariable %= 20 CONST

scoreboard players operation #InSeconds gameVariable = TimeInTicks gameVariable
scoreboard players operation #Every20Ticks gameVariable = Countdown gameVariable
function moesh:math/divide_by_twenty

execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displayMinute gameVariable = #InSeconds gameVariable
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displayMinute gameVariable /= 60 CONST
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displaySecond gameVariable = #InSeconds gameVariable
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displaySecond gameVariable %= 60 CONST

#---------------------------------------------------------------------------------------------------
# Purpose: Display the actionbar
#---------------------------------------------------------------------------------------------------
# Single-digit seconds timer actionbar display
execute if score #Every20Ticks gameVariable matches 0 run function moesh:game/display_actionbar_timer

#---------------------------------------------------------------------------------------------------
# Purpose: Announce time progression in chat
#---------------------------------------------------------------------------------------------------
# Send message at 60 seconds left
execute if score TimeInTicks gameVariable matches 1200 run tellraw @a {"translate":"Match will end in %s seconds.","color":"green","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
# Send message at 30 seconds left
execute if score TimeInTicks gameVariable matches 600 run tellraw @a {"translate":"Match will end in %s seconds.","color":"green","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
# Send message at 10 seconds left
execute if score TimeInTicks gameVariable matches 200 run tellraw @a {"translate":"Match will end in %s seconds.","color":"green","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
# End game
execute if score TimeInTicks gameVariable matches 0 run function moesh:game/end_round