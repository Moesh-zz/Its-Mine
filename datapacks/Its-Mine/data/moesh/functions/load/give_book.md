#---------------------------------------------------------------------------------------------------
# Purpose: Gives a book which acts as a menu and other stuff.
#---------------------------------------------------------------------------------------------------

/give @p written_book{
	title:"It's Mine!",
	author:Moesh,
	display:{Lore:["Game information"]}
	pages:['["",
		{"text":"It\'s Mine!\\n","bold":true,"italic":true},
		{"text":"a game by Moesh\\n","italic":true,"color":"reset"},
		{"text":"\\n","color":"reset"},	
		{"text":"How to win\\n","bold":true},
		{"text":"Bring the most ores to the trader within the time limit.\\n","color":"reset"},
		{"text":"\\n","color":"reset"},	
		{"text":"Menu\\n","bold":true},
		{"text":"Start","underlined":true,"color":"blue","clickEvent":{"action":"run_command","value":"/trigger startMatch set 1"},"hoverEvent":{"action":"show_text","value":"Starts a game in 15 seconds.\\nCommand: /trigger startGame set 1"}},
		{"text":" (","color":"reset"},
		{"text":"cancel","underlined":true,"color":"blue","clickEvent":{"action":"run_command","value":"/trigger cancelStart set 1"},"hoverEvent":{"action":"show_text","value":"Cancels a game start sequence.\\nCommand: /trigger cancelStart set 1"}},
		{"text":")\\n","color":"reset"},
		{"text":"GG","underlined":true,"color":"blue","clickEvent":{"action":"run_command","value":"/trigger gg set 1"},"hoverEvent":{"action":"show_text","value":"Leave the game early.\\nCommand: /trigger gg set 1"}},
		{"text":"\\n","color":"reset"},
		{"text":"Reset","underlined":true,"color":"blue","clickEvent":{"action":"run_command","value":"/trigger reset set 1"},"hoverEvent":{"action":"show_text","value":"Reset the current arena to its original state.\\nCommand: /trigger reset set 1"}}
	]'],
}