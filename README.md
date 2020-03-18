# The Caving Game (working title)

### Introduction
There's ore down there! The player who collects the most ore in 10 minutes AND brings them back, wins! 

### Description
This focus of them is game is on the survival Minecraft caving experience. Players will enter dangerous caves (or other locales) to retrieve ore and bring it back to the survive. Problem is, the places have been overrun with mobs.

This is a race, first and foremost. Players cannot attack each other... directly.

Players are very mobile in this game. They can choose between Scaffolding, Elytra (with Fireworks), or a few Ender Pearls. These items are refilled when they return to a bank.

All mob drops will be changed to low-value food, such as melon or bread. More difficult mobs will drop high value food. For example, Magma Slimes will drop cooked food.

### Core values
- This is a race, not a fight.
- The player is entering a dangerous place.
- The player is very mobile.
- All drops are useful to the player.

# Living design document

_This is a living document, everything is suspectible to change._

## Want to make an level for this game?
I am creating this world and datapack so others can feel free to create a level for something without having to also create a data pack. My hope is to make it so you can apply it to your world and it just works. We'll see how that goes. :)

### Design advice
The arena you create should feel dangerous. The player should feel like they are entering somewhere that has been overrun with monsters. The most valuable ores should be placed where the most danger is likely to be. Make ample use of monster spawners.

It is OK to design a classic vanilla cave system, old mines, or something very abstract and wild! The important thing is that the placement of your the ores is compelling.

### Requirements
_All arenas MUST meet these requirements._
- Must have ores, see the Scoring section below.
- Must have monsters (as they drop food and other useful items).
- Must have an Lectern. This is be used as player's menu.
- Must have at least one Wandering Trader (
	- Required attributes: Glowing:1b, Invulernable:1b
	- Can be named whatever you like. Can have NoAI on or off, up to you
	- Example summon command: ```/summon minecraft:wandering_trader ~ ~ ~ {Invulnerable:1b,Glowing:1b,CustomNameVisible:1b,NoAI:1b,CustomName:'{"text":"Resupply"}'}```
- All arenas must be fully encased by at least one bedrock layer
	- This make resetting the level very, very quick by avoiding recalculating sky light.
	- The level should feel oppressive, sky is a bit too comforting.
	- Going "underground" is core to the caving experience.
- Area size cannot exceed 30x30 chunks. _(A level that large would be very excessive. I've found 96x96x96 blocks to be more than enough space to create an interesting level.)_


### Design quirks you should consider
- Players will be glowing, and can see each other through walls
- The Trader is glowing, and has a distinct outline and color from players
- All non-ore blocks will drop Glass instead of their usual drop.
- All mobs will drop food, torches, and items useful to players depending on their class.
- Players will have a 60 second grace period to return to an Wandering Trader at the end of the game. If they die during this period, they are moved to spectator mode.
- Players will be able to travel through your map while the game is in lobby mode. They will have not be invulnerable, will respawn instantly, and have an item which allows them to teleport to back to the Ender Chest.

## Scoring
A player's score is only revealed at the end of the game, for dramatic effect. They are counted and added in the order listed below.

Ores are only counted if they are turned in to an Iron Golem!

### Point values
- Coal (item): 1 point
- Iron Ore (block): 2 points
- Gold Ore (block): 22 points
- Redstone (item): 8 points (potential for 8 to 48 points per block found)
- Diamond: 62 points
- Emerald: 127 points
- Lapis Lazuli = 56 (potential for 224 to 504 points per block found)

## Items given to the player

All players are equipped with these items:

- **Diamond Pickaxe** * 1 (given)
	- When in main hand:
		- -2 Attack Speed
		- +14 Attack Damage
	- Unbreakable
	- No enchantments
	- Given back when dropped
- **Shield** * 1 (replaces item offhand)
	- When in off hand:
		- +20 Max Health
		- +20 Armor
	- Unbreakable
	- Given back when dropped
- **Torches** * 8 (given)
	- Refilled up to 8 at an Trader location
	- High chance to be dropped by mobs
- **Food** * 2 (given)
	- Refilled up to 2 an Trader location
	- High chance to be dropped by mobs


## Items (HIGHLY SUBJECT TO CHANGE!!!!)

### Scaffolding
Weave a wooden web of troubles.

Items:
- **Scaffolding** (given)
	- Refills at a medium rate.

### Elytra
Fly anywhere, be a daredevil.

Items:
- **Elytra** (replaceitem chest slot)
- **Fireworks** * 3 (given)
	- Medium chance to be dropped by mobs

### Ender Pearls
Skip the flight, get there instantly.

Items:
- **Ender Pearls** * 3 (given)
	- Medium chance to be dropped by mobs
