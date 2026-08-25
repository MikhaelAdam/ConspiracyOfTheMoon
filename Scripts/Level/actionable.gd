class_name Actionable extends Area2D

signal _actionable_clicked()

var is_hovered: bool = false

func _input(event: InputEvent) -> void:
	if is_hovered and event is InputEventMouseButton and event.pressed:
		_actionable_clicked.emit()

func _enter_tree() -> void:
	self.mouse_entered.connect(self._on_mouse_entered)
	self.mouse_exited.connect(self._on_mouse_exited)
	self.monitorable = false
	
func _on_mouse_entered() -> void:
	self.is_hovered = true

func _on_mouse_exited() -> void:
	self.is_hovered = false