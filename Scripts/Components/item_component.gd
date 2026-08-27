# For items that can be grabbed via actionable
extends Node
class_name ItemComponent

@export var item_resource: ItemResource
@export var actionable: Actionable

func _enter_tree() -> void:
    if actionable:
        actionable._actionable_clicked.connect(_on_item_picked)

func _on_item_picked() -> void:
    if item_resource and not item_resource.is_in_inventory:
        item_resource.is_in_inventory = true
        EventBus._item_picked.emit(item_resource)