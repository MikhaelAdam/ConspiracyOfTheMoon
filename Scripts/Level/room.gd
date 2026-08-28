extends Node2D
class_name Room

const THRESHOLD := 100.0
const SPEED := 300.0

signal _room_entered(room: Room)
signal _room_exited(room: Room)

@export var background: Sprite2D

var is_player_inside: bool = false
var left_limit: float = 0
var right_limit: float = 0

func _ready() -> void:
    left_limit = -(background.texture.get_size().x - get_viewport().get_visible_rect().size.x)/2
    right_limit = (background.texture.get_size().x - get_viewport().get_visible_rect().size.x)/2


func _process(delta: float) -> void:
    position.x = clamp(position.x, left_limit, right_limit)
    
func enter_room() -> void:
    is_player_inside = true
    show()
    _room_entered.emit(self)

func exit_room() -> void:
    is_player_inside = false
    hide()
    _room_exited.emit(self)

func move_room(move_dir: float, delta: float) -> void:
    position.x += move_dir * SPEED * delta