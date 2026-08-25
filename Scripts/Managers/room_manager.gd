extends Node2D
class_name RoomManager

var current_room: Room = rooms[0]
var rooms: Array[Room] = []

func _enter_tree() -> void:
    for r in get_children():
        if r is Room:
            rooms.append(r)
