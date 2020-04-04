# It's Mine!
*This is a game made with a [datapack](https://minecraft.gamepedia.com/Data_pack) for [Minecraft: Java Edition](https://www.minecraft.net/store/minecraft-java-edition). I designed this game to allow anyone to build a level, activate the datapack, and play! If you can open Minecraft, you can do this.

I hope this game will inspire you to create something new!*

[![Discord](https://img.shields.io/discord/204792442225033216?label=Dinner%20Party%20Games)](https://discord.gg/8Yyaj93)

## Description

This game focuses on the experience of [mining](https://minecraft.gamepedia.com/Tutorials/Exploring_caverns) (also known as caving) in Minecraft. Players will traverse through dangerous locales to dig up ore. They will fight dangerous enemies who drop food and other helpful items.

To win, bring the most ore to a Wandering Trader within the time limit!

## Table of contents
- [It's Mine!](#it-s-mine-)
  * [Description](#description)
  * [Table of contents](#table-of-contents)
- [How to design an level](#how-to-design-an-level)
  * [Design directions](#design-directions)
    + [Core values](#core-values)
    + [Technical requirements](#technical-requirements)
    + [Other details to take into consideration](#other-details-to-take-into-consideration)
  * [Altered global features](#altered-global-features)
  * [Items given to the player](#items-given-to-the-player)
  * [Items which drop](#items-which-drop)

# How to design an level
_This is a living document. Everything is suspectible to change._

## Design directions
Player should feel like they are somewhere dangerous; overrun with monsters. The most valuable ores are where the most danger is likely to be. 

It is OK to design a classic vanilla cave system, old mines, or something very abstract and wild! The rules and features of _It's Mine!_ allow for a variety of different ideas! A level with only a handful of ores? Something vertical?

The important thing is compelling placement of the ores and hostiles in your level.

### Core values
These are the core values I used to design this game:
- This is a race, not a fight.
- The player is entering a dangerous place.
- The player is very mobile.
- All drops are useful to the player.

I've put a great deal of consideration and intent into these values. Games are complex, heaving things. Values help prevent feature creep. . These values have provided guidance when I've needed to pass judgment on my design.

During this development process, I decided to make a drastic change to the items I give to the player. By removing Ender Pearls and Elytra as loadout items, I reduced the player's mobility. **This went against a core value.** To compensate, . Then I also made Ender Pearls a rare drop for hostile mobs.

To recap, I made a design choice which broke a core value: "The player is very mobile." I needed replace the lost mobility while also meeting other unforeseen requirements.

By having a value-driven project, I am more confident in experimentation, as I have created values to hold them up against.

### Technical requirements
_All levels MUST meet these requirements._
- **Must have ores**
	- Ores: Coal, Iron Ore, Gold Ore, Redstone, Diamond, and Lapis Lazuli
	- Only way to score points
	- See [scoring section](#Scoring) for point values
- **Must have [hostile mobs](https://minecraft.gamepedia.com/Mob#Hostile_mobs)**
	- Hostile mobs drop food, torches, and scaffolding
	- Rare drops include: Ender Pearls
- **Must have at least one [lectern](https://minecraft.gamepedia.com/Lectern)**
	- Used as a main menu
	- Only the lectern must exist
	- _Notes: A second or third lectern may be created_
	- Many lecterns with the menu book can exist, the datapack will populate each defined location
- **Must have at least one [Wandering Trader](https://minecraft.gamepedia.com/Wandering_Trader)**
	- Required attributes: `Glowing:1b, Invulernable:1b`
	- `NoAI:1b` is not required
	- Must always be accessible by players during the last 60 seconds of the match
- **Must have at least one [Trader Llama](https://minecraft.gamepedia.com/)**
	- Required attributes: `Glowing:1b, Invulnerable:1b`
	- Trader Llamas turn all possible hostile mobs into rabbits (5 block radius from eyes)
- **Encased by at least one bedrock layer**
	- This make resetting the level very, very quick by avoiding sky light recalculations.
	- The level should feel a bit oppressive. The sky is a bit too comforting.
	- Going "underground" is core to the caving experience.
- **Must not exceed 10x10 chunks.**
	- A region file is 32x32 chunks, there is more technical risk when an level crosses the border of a region files
	- I've found 96x96x96 blocks to be more than enough space to create an interesting level.

### Other details to take into consideration
_It's Mine!_ has altered Minecraft's survival gameplay. These alterations could have an impact on your level design choices. I made with the intention to focus the player's attention on mining and going fast._

- Players can kill mobs with 1-2 hits from their Pickaxe
- Players have the equal of full diamond armor, and twice their health, when holding their shield in their offhand. They are not meant to die quickly.
- Players will glow, and can see each other through walls
- The Wandering Trader and Trader Llamas will glow, and have a distinct outline and color from players
- All non-ore blocks will drop Scaffolding instead of their usual drop _(subject to change)_
- Players will have a 60 second grace period to return to an Wandering Trader at the end of the game. If they die during this period, they are moved to spectator mode and their ores remain on the ground.
- While in lobby state, players...
	- ...can travel through your level
	- ...will have all their ingame items to study
	- ...will be in adventure mode (cannot place or break blocks) 
	- ...will not be invulnerable
	- ...will respawn instantly
	- ...have the ability to teleport back to the Lectern
- Players cannot attack each other... directly.

## Altered global features
Some Minecraft features, which players may expect to work as normal, have been altered. 

- Silverfish will spawn when ores are not lit (must light level 8+ to spawn their usual ores)
- Trader Llamas looks for potentially hostile mobs within a 5 block radius, and turns them into rabbits
- Scaffolding applies the levitation effect when players is standing inside of them (also stops when sneaking)
- The vanilla datapack has been disabled to remove the default advancements and recipes
Elements required to make Minecraft work as players expect have been replicated
- Players will only have to walk near a Wandering Trader to trigger the "turn-in/refill" sequence instead of trading with them


## Items given to the player

Players are equipped with these items:

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
- **Chainmail Boots** (replaces feet armor slot)
	- Feather Falling (level 4)
	- Unbreakable
	- Curse of Binding

Players are given these items when near a Wandering Trader
- **Torches** * 8 (given)
- **Food** * 2 (given)
- **Scaffolding** * 8 (given)

## Items which drop
These are the only items which can be dropped by mobs or blocks.
- **Food**: Normal chance to be dropped by hostile mobs
- **Scaffolding**: Drops from blocks (one to one) and hostile mobs
- **Torches**: Normal chance to be dropped by hostile mobs. Silverfish drop 1-3 torch on death.
- **Ender Pearls**: Very low chance to be dropped by hostile mobs
