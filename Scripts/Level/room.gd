extends Node2D
class_name Room

signal _room_entered(room: Room)
signal _room_exited(room: Room)

var is_player_inside: bool = false

func enter_room() -> void:
    is_player_inside = true
    show()
    _room_entered.emit(self)

func exit_room() -> void:
    is_player_inside = false
    hide()
    _room_exited.emit(self)