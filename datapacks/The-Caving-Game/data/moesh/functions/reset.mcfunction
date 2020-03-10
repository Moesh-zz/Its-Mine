# Called from: moesh:tick, moesh:game/start_round

#---------------------------------------------------------------------------------------------------
# Purpose: Reset both the blocks and gamerules to the shipping state
#---------------------------------------------------------------------------------------------------
function moesh:load/set_rules
function moesh:load/setup_objectives_and_teams
schedule function moesh:load/clear_entities 1t