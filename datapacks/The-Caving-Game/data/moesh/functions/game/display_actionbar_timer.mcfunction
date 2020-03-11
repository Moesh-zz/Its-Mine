#---------------------------------------------------------------------------------------------------
# Purpose: Timer can display in double and single digits, let's handle that.
#---------------------------------------------------------------------------------------------------
execute if score displaySection gameVariable matches 0..9 run title @a actionbar {"translate":"%s:0%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} }]}
execute if score displaySection gameVariable matches 10 run title @a actionbar {"translate":"%s:%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} } ]}