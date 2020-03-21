# Called from: moesh:player/check_for_trader

#---------------------------------------------------------------------------------------------------
# Purpose: Take ores from players and keep track until the end of the game.
#---------------------------------------------------------------------------------------------------

# Refill health and food
effect give @s minecraft:instant_health 1 3 false
effect give @s minecraft:saturation 5 100 false

# If they don't have a pickaxe, give them one!
execute unless entity @a[nbt={Inventory:[{id:"minecraft:diamond_pickaxe"}]}] run give @s minecraft:diamond_pickaxe{Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:-2,Operation:0,UUIDLeast:441480,UUIDMost:965428,Slot:"mainhand"},{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:14,Operation:0,UUIDLeast:995521,UUIDMost:423040,Slot:"mainhand"}]}

# Replace offhand slot Shield if player does not have a shield in their inventory
execute unless entity @a[nbt={Inventory:[{id:"minecraft:shield"}]}] run replaceitem entity @s weapon.offhand minecraft:shield{Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.maxHealth",Name:"generic.maxHealth",Amount:20,Operation:0,UUIDLeast:194027,UUIDMost:990464,Slot:"offhand"},{AttributeName:"generic.armor",Name:"generic.armor",Amount:20,Operation:0,UUIDLeast:214881,UUIDMost:151369,Slot:"offhand"}]} 1

# Clear up to 8 torches and then them back.
clear @s minecraft:torch 8
give @s minecraft:torch 8

# Clear up to 32 scaffolding and then give them back
clear @s minecraft:scaffolding 32
give @s minecraft:scaffolding 32