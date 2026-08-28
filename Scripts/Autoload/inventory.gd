extends Node

var items: Dictionary[String, ItemResource] = {}

func add_item(key: String, item: ItemResource) -> ItemResource:
    return items.get_or_add(key, item)

func has_item(key: String) -> bool:
    if items.is_empty(): return false
    return items.has(key)

func remove_item(key: String) -> bool:
    if items.is_empty(): return false
    return items.erase(key)

func clear() -> void:
    if items.is_empty(): return
    items.clear()