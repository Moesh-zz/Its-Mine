# Called from #moesh:load

#---------------------------------------------------------------------------------------------------
# Purpose: Kill entities and items by teleporting them down to void and then killing them.
#---------------------------------------------------------------------------------------------------

# Killing all entities can take a moment. Let's schedule this out so we are confident everything
# runs as it needs to. After this, all entities should have one copy in their location, and should
# glow green.
schedule function moesh:load/reset_entities/kill 4t
schedule function moesh:load/reset_entities/summon_traders 4t
schedule function moesh:load/reset_entities/make_traders_glow 4t

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Wandering Trader and Trader Llamas summoned","color":"light_purple"}]}