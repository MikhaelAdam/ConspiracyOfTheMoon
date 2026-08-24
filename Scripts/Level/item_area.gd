class_name ItemArea extends Area2D

@export var item_resource: ItemResource

var is_hovered: bool = false
var is_picked: bool = false

func _input(event: InputEvent) -> void:
	if is_hovered and event is InputEventMouseButton and event.pressed and not is_picked:
		is_picked = true
		item_resource.is_in_inventory = true
		EventBus._item_picked.emit(item_resource)

func _enter_tree() -> void:
	self.mouse_entered.connect(self._on_mouse_entered)
	self.mouse_exited.connect(self._on_mouse_exited)
	self.monitorable = false
	
func _on_mouse_entered() -> void:
	self.is_hovered = true

func _on_mouse_exited() -> void:
	self.is_hovered = false