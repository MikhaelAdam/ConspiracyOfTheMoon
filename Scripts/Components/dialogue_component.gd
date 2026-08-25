class_name DialogueComponent extends Node

@export var dialogue: DialogueResource
@export var dialogue_start: String = "start"
@export var actionable: Actionable = null

func _enter_tree() -> void:
	if actionable:
		actionable._actionable_clicked.connect(_on_actionable_clicked)

func _on_actionable_clicked() -> void:
	if dialogue:
		DialogueManager.show_dialogue_balloon(dialogue, dialogue_start)
