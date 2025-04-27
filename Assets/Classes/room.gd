extends Node
class_name Room # AKA vertex/node

# {letter = A, orb_found : bool = false, mod_color = Color()}
var letter_id : String = "START" # START is starting room in game, like the menu
var orb_found : bool = false
var mod_color : Color = Color(0, 0, 0)
