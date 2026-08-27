extends Node2D

const MAX_THRESHOLD = 50.0

var rooms: Array[Room] = []
var current_room: Room

func _ready() -> void:
	for r in get_children():
		if r is Room:
			rooms.append(r)
	current_room = rooms[0]
	current_room.show()
	EventBus._change_room.connect(_on_change_room)

func _process(delta: float) -> void:
	pass

func _on_change_room(from: Room, to: Room) -> void:
	from.exit_room()
	to.enter_room()
	print("Change from "+ from.name + " to "+ to.name)
