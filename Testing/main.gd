extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus._item_picked.connect(func(item_resource: ItemResource) -> void: 
		print("Item picked: " + str(item_resource.item_name))
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
