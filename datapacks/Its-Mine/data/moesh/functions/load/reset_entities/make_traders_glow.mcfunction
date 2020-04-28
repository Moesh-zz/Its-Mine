# Scheduled by: moesh:reset_entities

#---------------------------------------------------------------------------------------------------
# Purpose: Make Wandering Trader and Trader Llamas join the team, "traders" and then make them glow.
#---------------------------------------------------------------------------------------------------

team join traders @e[type=minecraft:wandering_trader]
team join traders @e[type=minecraft:trader_llama]
effect give @e[team=traders] minecraft:glowing 999999 0 true

# All players are forced into adventure mode when this function is called, no one would see the
# usual "alert dev" message.