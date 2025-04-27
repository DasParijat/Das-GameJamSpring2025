extends Node2D

var cur_room : Room
var points : int

var rooms_array : Array[Room] = [Room.new("START", Color(0,0,0))] # starting room
var doors_array : Array[Door]

var alphabet : Array[String] = [
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
	"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
]

func _ready() -> void:
	randomize()
	
	generate_rooms()
	doors_array = [Door.new(rooms_array[0], rooms_array[1])] # starting door
	
func generate_rooms(num_of_rooms : int = 10) -> void:
	if num_of_rooms < 4 or num_of_rooms > 26:
		num_of_rooms = 10
		printerr("Game: GIVEN NUM_OF_ROOMS NOT VALID, SET TO 10")
		 
	for i in range(num_of_rooms):
		rooms_array.append(
			Room.new(alphabet[i], 
					Color(randi_range(0.2,0.6)
						,randi_range(0.2,0.6)
						,randi_range(0.2,0.6)))
			)
		print("added room: ", rooms_array[i + 1].letter_id)

# TODO add code to generate dungeon, get starting points
