class_name RoomArea extends Area2D

@export var room: Room

var is_mouse_over: bool = false

func _input(event: InputEvent) -> void:
    if is_mouse_over and event is InputEventMouseButton and event.pressed:
        EventBus._room_area_clicked.emit(self.owner as Room, room)

func _ready() -> void:
    self.mouse_entered.connect(_on_mouse_entered)
    self.mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
    is_mouse_over = true

func _on_mouse_exited() -> void:
    is_mouse_over = false