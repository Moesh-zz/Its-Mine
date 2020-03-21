# Called from: minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions
#---------------------------------------------------------------------------------------------------
# Any function here usually has it's own handling for lobby time and match time.

# Let's first check to see if any online player has left the game
execute as @a[scores={leaveGame=1..}] at @s run function moesh:player/left_game

# The functions below will handle players, no matter what state the game is in.
execute as @a[tag=!Registered] at @s run function moesh:player/reset
execute as @a[tag=!Registered] at @s run function moesh:player/set_objectives
execute as @a[tag=!Registered] run tellraw @s {"text":"Welcome to The Caving Game!"}


execute as @a[tag=!Registered] run tag @s add Registered

# Players can always use scaffolding as chutes.
function moesh:player/chutes

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------

# This line below is for players who want to be cheeky. If they ever set a score for startMatch,
# go ahead and assume they want to start the match.
execute if score GameState gameVariable matches 0 run scoreboard players set @a[scores={startMatch=..-1}] startMatch 0
execute if score GameState gameVariable matches 0 run scoreboard players enable @a[scores={startMatch=0}] startMatch

# If a game is not starting, check to see if players want to start a game
execute as @a[scores={startMatch=1..}] at @s run function moesh:lobby/trigger_start_match

# If a game start is happening, check to see if players want to cancel it
execute as @a[scores={cancelStart=1..}] at @s run execute if score StartingMatch gameVariable matches 1 run function moesh:lobby/trigger_cancel_start

# Tick this every second if the players will it
execute if score GameState gameVariable matches 0 if score StartingMatch gameVariable matches 1 run function moesh:lobby/timer

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the match
#---------------------------------------------------------------------------------------------------

# Prevent players from leaving the play area
execute as @a at @s unless entity @s[gamemode=spectator] if score GameState gameVariable matches 1 run function moesh:game/out_of_bounds

# This next line is essentially protection of players against themselves. They can use
# Let players run a GG command to end a game early
# /trigger set gg 0, therefore disabling the gg trigger for themselves.
execute if score GameState gameVariable matches 1 run scoreboard players set @a[scores={gg=..-1}] gg 0
execute if score GameState gameVariable matches 1 run scoreboard players enable @a[scores={gg=0}] gg
execute as @a[scores={gg=1..}] at @s if score GameState gameVariable matches 1 run function moesh:player/gg

execute if score GameState gameVariable matches 1 run execute as @a at @s run function moesh:player/check_for_trader

# Kill mobs who go near Trader Llamas
execute as @e[type=minecraft:trader_llama] at @s anchored eyes run function moesh:game/convert_hostiles_to_harmless

# Countdown the timer!
execute if score GameState gameVariable matches 1 run function moesh:game/timer

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions after the match
#---------------------------------------------------------------------------------------------------
# Let players look at the map before resetting it. It must be done manually.
execute if score GameState gameVariable matches 2 run scoreboard players set @a[scores={reset=..-1}] reset 0
execute if score GameState gameVariable matches 2 run scoreboard players enable @a[scores={reset=..0}] reset
execute if entity @a[scores={reset=1..}] if score GameState gameVariable matches 2 run function #moesh:load
execute if entity @a[scores={reset=1..}] if score GameState gameVariable matches 2 run scoreboard players reset * reset