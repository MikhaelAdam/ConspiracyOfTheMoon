extends Node2D

const MAX_THRESHOLD = 100.0

var rooms: Array[Room] = []
var current_room: Room
var can_pan: bool = false

@onready var viewport_width := get_viewport().get_visible_rect().size.x

func _ready() -> void:
	for r in get_children():
		rooms.append(r as Room)
		
	current_room = rooms[0]
	current_room._room_entered.connect(_on_room_entered)
	EventBus._change_room.connect(_on_change_room)
	current_room.enter_room()

func _process(delta: float) -> void:
	if not current_room.is_player_inside:
		return  
	var mouse_x := get_viewport().get_mouse_position().x    
	var move_dir := 0.0
	if mouse_x < MAX_THRESHOLD:
		move_dir = 1.0  
	elif mouse_x > viewport_width - MAX_THRESHOLD:
		move_dir = -1.0  
	if can_pan:
		current_room.move_room(move_dir, delta)

func _on_change_room(from: Room, to: Room) -> void:
	from.exit_room()
	to.enter_room()
	current_room = to

func _on_room_entered(room: Room) -> void:
	var bg_width: float = room.background.texture.get_size().x
	if bg_width > viewport_width:
		can_pan = true
