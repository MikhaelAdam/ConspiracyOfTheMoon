class_name RoomChangeComponent extends Node

@export var target_room: Room = null
@export var actionable: Actionable = null

func _enter_tree() -> void:
    if actionable:
        actionable._actionable_clicked.connect(_on_actionable_clicked)

func _on_actionable_clicked() -> void:
    if target_room:
        EventBus._change_room.emit(target_room)
