extends Node2D

var cur_room : Room
var points : int

var rooms_array : Array[Room] = [Room.new("START", Color(0,0,0))] # starting room
var doors_array : Array[Door] = [] # starting door

func _ready() -> void:
	randomize()

# TODO add code to generate dungeon, get starting points
