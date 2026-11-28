extends Control

@onready var slots = $TextureRect/GridContainer.get_children()

func _ready():
	visible = false
	for slot in slots:
		_set_slot_texture(slot, null)

func _input(event):
	if event.is_action_pressed("inventory"):
		visible = not visible

func add_item(item_texture: Texture2D) -> bool:
	if item_texture == null:
		return false
	for slot in slots:
		if _get_slot_texture(slot) == null:
			_set_slot_texture(slot, item_texture)
			return true
	return false

func _get_slot_texture(slot: Node) -> Texture2D:
	if slot is TextureRect:
		return slot.texture
	for child in slot.get_children():
		if child is TextureRect:
			return child.texture
	return null

func _set_slot_texture(slot: Node, tex: Texture2D) -> void:
	if slot is TextureRect:
		slot.texture = tex
		return
	for child in slot.get_children():
		if child is TextureRect:
			child.texture = tex
			return
