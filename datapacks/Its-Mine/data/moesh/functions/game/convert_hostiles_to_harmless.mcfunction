#---------------------------------------------------------------------------------------------------
# Purpose: A hostile mob walked close to a trading llama, convert them to a rabbit.
#---------------------------------------------------------------------------------------------------

# Make the llama face a close hostile mob
execute if entity @e[type=#moesh:hostile,distance=..5] run teleport @s ~ ~ ~ facing entity @e[type=#moesh:hostile,distance=..5,limit=1]
# Make it seem like the llama spits
execute if entity @e[type=#moesh:hostile,distance=..5] run playsound minecraft:entity.llama.spit neutral @a ~ ~ ~ 20 1.2
execute if entity @e[type=#moesh:hostile,distance=..5] run execute as @e[type=#moesh:hostile,distance=..5] at @s run particle minecraft:spit ~ ~ ~ 0 1 0 0.05 50 force

# Hide and kill the hostile mob. Trade secret: Rabbit is in the boot.
effect give @e[type=#moesh:hostile,distance=..5] minecraft:invisibility 3 0 true
execute if entity @e[type=#moesh:hostile,distance=..5] run execute as @e[type=#moesh:hostile,distance=..5] at @s run summon minecraft:rabbit
kill @e[type=#moesh:hostile,distance=..5]