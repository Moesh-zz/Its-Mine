# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------
# Tick timer down. We always tick time in game ticks (20 ticks a second) for a reasonable accuracy.
scoreboard players remove TimeInTicks gameVariable 1

# Do some math that is similar to math we do other places. Load the variables into their slots and
# then run the math function!
scoreboard players operation #InSeconds gameVariable = TimeInTicks gameVariable
scoreboard players operation #Every20Ticks gameVariable = TimeInTicks gameVariable
function moesh:math/divide_by_twenty

# We'll likely only ever these math commands in this function. By dividing (/=) #InSeconds by 60, 
# we get a whole number that is the minutes which are left in the game. By finding the modulus (%=)
# of #InSeconds, we get a whole number output of the seconds left in the current minute. We'll use
# this to get a human readable timer output. Displaying seconds left doesn't feel amazing when
# there is 492 seconds left. How much time is that? Really? I need to put the player's focus on
# other things. This is too distracting.
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displayMinute gameVariable = #InSeconds gameVariable
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displayMinute gameVariable /= 60 CONST
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displaySecond gameVariable = #InSeconds gameVariable
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displaySecond gameVariable %= 60 CONST

#---------------------------------------------------------------------------------------------------
# Purpose: Display the actionbar
#---------------------------------------------------------------------------------------------------
# Display this actionbar when the seconds are in the single-digits (0 to 9 seconds)
execute if score #Every20Ticks gameVariable matches 0 if score displaySecond gameVariable matches 0..9 run title @a actionbar {"translate":"%s:0%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} }]}
# Display this actionbar when the seconds are in the double-digits (10 to 59 seconds)
execute if score #Every20Ticks gameVariable matches 0 if score displaySecond gameVariable matches 10.. run title @a actionbar {"translate":"%s:%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} } ]}

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