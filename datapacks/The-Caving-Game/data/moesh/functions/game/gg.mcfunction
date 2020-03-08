execute if entity @a[team=blue,scores={gg=1..}] run tellraw @a {"translate":"%s Blue waves the white flag.","color":"green","with":[{"text":">>>","color":"white"}]}
execute if entity @a[team=blue,scores={gg=1..}] run function rev:game/red_wins

execute if entity @a[team=red,scores={gg=1..}] run tellraw @a {"translate":"%s Red waves the white flag.","color":"green","with":[{"text":">>>","color":"white"}]}
execute if entity @a[team=red,scores={gg=1..}] run function rev:game/blue_wins

scoreboard players reset gg