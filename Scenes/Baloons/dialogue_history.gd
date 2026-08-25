extends MarginContainer

const FONT = preload("res://Assets/Fonts/CormorantGaramond-VariableFont_wght.ttf")

func _ready() -> void:
	clear_history()
	DialogueManager.dialogue_ended.connect(func(_resource: DialogueResource) -> void:
		clear_history()
	)

func _on_dialogue_label_started_typing() -> void:
	await get_tree().create_timer(0.1).timeout
	%DialogueContainer.text += str("[b]" + %CharacterLabel.text + "[/b] : " + %DialogueLabel.dialogue_line.text) + "\n"


func _on_responses_menu_response_selected(_response: Variant) -> void:
	# use the color green for the player response
	%DialogueContainer.text += str("[color=green][b]You[/b] : " + _response.text) + "[/color]\n"

func clear_history() -> void:
	%DialogueContainer.text = ""
