extends MarginContainer

const FONT = preload("res://Assets/Fonts/CormorantGaramond-VariableFont_wght.ttf")

func _ready() -> void:
	clear_history()
	DialogueManager.dialogue_ended.connect(func() -> void:
		clear_history()
	)

func _on_dialogue_label_started_typing() -> void:
	var label = Label.new()
	label.text = %CharacterLabel.text + ": " + %DialogueLabel.dialogue_line.text
	label.add_theme_font_override("font", FONT)
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.custom_minimum_size.x = 300.0 
	await get_tree().create_timer(0.1).timeout
	%DialogueContainer.add_child(label)


func _on_responses_menu_response_selected(response: Variant) -> void:
	var label = Label.new()
	label.text = str("You: " + response.text)
	label.add_theme_font_override("font", FONT)
	label.add_theme_color_override("font_color", Color.GREEN)
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.custom_minimum_size.x = 300.0 
	%DialogueContainer.add_child(label)

func clear_history() -> void:
	for child in %DialogueContainer.get_children():
		child.queue_free()
