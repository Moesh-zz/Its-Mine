# Called from: moesh:player/check_for_trader

#---------------------------------------------------------------------------------------------------
# Purpose: Take ores from players and keep track until the end of the game.
#---------------------------------------------------------------------------------------------------

# Refill health and food
effect give @s minecraft:regeneration 3 10 false
effect give @s minecraft:saturation 5 100 false

# If they don't have a pickaxe, give them one!
execute unless entity @s[nbt={Inventory:[{id:"minecraft:diamond_pickaxe"}]}] run give @s minecraft:diamond_pickaxe{Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:-2d,Operation:0,UUIDLeast:441480L,UUIDMost:965428L,Slot:"mainhand"},{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:14d,Operation:0,UUIDLeast:995521L,UUIDMost:423040L,Slot:"mainhand"}]}

# Replace offhand slot Shield if player does not have a shield in their inventory
execute unless entity @s[nbt={Inventory:[{id:"minecraft:shield"}]}] run replaceitem entity @s weapon.offhand minecraft:shield{Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.maxHealth",Name:"generic.maxHealth",Amount:20,Operation:0,UUIDLeast:194027L,UUIDMost:990464L,Slot:"offhand"},{AttributeName:"generic.armor",Name:"generic.armor",Amount:20,Operation:0,UUIDLeast:214881L,UUIDMost:151369L,Slot:"offhand"}]} 1

# Give the player Feather Falling boots if they do not already have some
execute unless entity @s[nbt={Inventory:[{id:"minecraft:chainmail_boots"}]}] run replaceitem entity @s armor.feet minecraft:chainmail_boots{Unbreakable:1b,Enchantments:[{id:"minecraft:feather_falling",lvl:4s},{id:"minecraft:binding_curse",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0d,Operation:0,UUIDLeast:145740L,UUIDMost:120074L}]} 1

# Give players torches and scaffolding
execute as @s run function custom-level:give_items