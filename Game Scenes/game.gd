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
	generate_doors()
	
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
		#print("added room: ", rooms_array[i + 1].letter_id)

# TODO add code to generate dungeon, get starting points
func generate_doors() -> void:
	# Starting door
	# NOTE - no other room should connect to starting door besides A
	doors_array = [Door.new(rooms_array[0], rooms_array[1])] # starting door
	Door.new(rooms_array[0], rooms_array[1]).print_door()
	
	## 1st for loop (make sure all rooms are connected)
	for i in range(rooms_array.size() - 2):
		doors_array.append(
			Door.new(rooms_array[i + 1], 
					rooms_array[i + 2])
		)
		Door.new(rooms_array[i + 1], rooms_array[i + 2]).print_door()
	
	print("2ND LOOP")
	## 2nd for loop (add random doors for each room)
	for i in range(rooms_array.size() - 1):
		var room1 : int
		var room2 : int
		var new_door : Door
		var reverse_door : Door
		# used to check against reverse doors
		# Ex. If {A, B} exists, then {B, A} shouldn't exist
		
		while (new_door in doors_array) or (reverse_door in doors_array) or !new_door:
			room1 = i + 1
			room2 = randi_range(1, rooms_array.size() - 1)
			while room2 == room1:
				room2 = randi_range(1, rooms_array.size() - 1)
				
			new_door = Door.new(rooms_array[room1], 
								rooms_array[room2])
			reverse_door = Door.new(rooms_array[room2],
									rooms_array[room1])
									
		
		doors_array.append(new_door)
		new_door.print_door()
