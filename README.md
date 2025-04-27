Topic: Connections

Idea - Prim's Dungeon
Description: 
	Prim's Dungeon is based off Prim's Algo of finding the MST of a graph. However instead of
	a graph, it is a dungeon, with each node being a room, and each door representing an edge with
	a weight. 
	
	An MST (Minimum-Spanning tree) of a graph is a graph with the same nodes, but with the lowest
	total cost of edges (aka, redundant edges are removed in the MST version). In relation to the
	topic, it means finding a way to keep all rooms/nodes "connected" while getting the smallest
	number of total weight possible.
	
	The goal of the game is for the player to get all orbs (one in each room) in order to escape
	or whatever. Meaning they must have explored every room in the dungeon
	
	The way the game works is that each door (a connection between two rooms) has a cost, which
	the player pays for via points they get at the start. The points they get at the start is
	the same as the total weight of the MST version of the graph/dungeon they play in, AKA,
	player's are forced to follow Prim's Algo in order to win.
	
Objects:
	Game:
		-Starting room is randomized (any room), but it must be kept track of once chosen (for resetting)
		-Display points and rooms visited (visited / total rooms) at top right
		-Display page on top right, which when clicked, gives player basic idea of what to do
		-Esc button/ Pause button bottom left, which allows user to reset level 
		(dungeon same, but they start over from the starting room)
		-If user tries buying a door, and it results 
		in them having points <= 0 (check this before room transition),
		then give game over screen.
		-Game over screen has button to reset game 
	Dungeon/Graph Generation (Hard):
		-Try making a default pre-made graph as test for game
		-Generate a random number of rooms (Min is 3, max is 26, default is 10)
		-Generate random edges
			-Go to each room and give them an edge to any other room (randomly)
			-If they randomly generate an edge that already exists, disregard that
			-TODO work on how graph generation will work
	Room/Node: 
		-Each room has a letter id (A, B, C)
		-Each room has an orb (Once player visits room, orb is taken)
			-Orb also serves as reminder if player has visited room or not
		-Each room has 1 to 3 doors (edges) to other rooms
	Door/Edge:
		-Door properties:
			-{Room A, Room B, Weight/Cost, lock status}
		-Door recognizes what room it is currently in
			-Ex. If {A, B} door is in room A, opening it will take player to room B, and vice versa
		-Once door is unlocked, it remains open the rest of the game
		-Going from room A to room B, room B has a door to Room A, 
		thus once player visits room B, door {A, B} should already be opened
		-Thus lock status indicates whether that door is locked or not, for any room
		
