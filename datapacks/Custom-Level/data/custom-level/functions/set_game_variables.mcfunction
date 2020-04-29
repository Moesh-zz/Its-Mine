# Called from: #moesh:load


##### WARNING ######################################################################################
# The items in this file are meant to be modified, not removed. This is some design stuff happens,
# so consider how your edits will affect how the game is played. For Example, if TimeToStartMatch
# is set to 12000 ticks (or 10 minutes), you may never get anyone to play the game with you!
####################################################################################################


# This file defines important variables used to run the game. I've broken it out into its own file
# to make it easier to modify. You can certainly still break things here, but you can also easily
# make edits to key components of the game, such as ore values and the time limit.


#---------------------------------------------------------------------------------------------------
# Purpose: Set-up scoreboard for customizable game variables.
#---------------------------------------------------------------------------------------------------

# 15 seconds countdown before the game begins
scoreboard players set TimeToStartMatch gameVariable 300
# Match should last for 10 minutes
scoreboard players set TimeToEndMatch gameVariable 12000

# Set-up ore values
scoreboard players set #Coal gameVariable 1
scoreboard players set #IronIngot gameVariable 2
scoreboard players set #GoldIngot gameVariable 22
scoreboard players set #Redstone gameVariable 8
scoreboard players set #Diamond gameVariable 62
scoreboard players set #Emerald gameVariable 127
scoreboard players set #LapisLazuli gameVariable 56

tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Game-specific variables set","color":"light_purple"}]}