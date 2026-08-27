# For items that can be grabbed via actionable
class_name RoomChangeComponent extends Node

@export var room_owner: Room
@export var target_room: Room
@export var actionable: Actionable

func _ready() -> void:
	assert(room_owner, "Please give this component an owner")
	assert(target_room, "Please give this component an target")
	assert(actionable, "Please give this component an actionable")

	if actionable:
		actionable._actionable_clicked.connect(_on_actionable_clicked)

func _on_actionable_clicked() -> void:
	if target_room:
		EventBus._change_room.emit(room_owner, target_room)
