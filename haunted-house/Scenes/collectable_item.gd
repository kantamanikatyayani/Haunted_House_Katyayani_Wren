@tool
extends Area2D

@export var item_texture: Texture2D:
	set(value):
		item_texture = value
		if has_node("Sprite2D"):
			$Sprite2D.texture = item_texture

func _ready():
	if not Engine.is_editor_hint():
		if not body_entered.is_connected(_on_body_entered):
			body_entered.connect(_on_body_entered)
		# Fallback: if item_texture wasn't set in Inspector, use Sprite2D's texture
		if item_texture == null and has_node("Sprite2D"):
			item_texture = $Sprite2D.texture

	if item_texture and has_node("Sprite2D"):
		$Sprite2D.texture = item_texture

func _on_body_entered(body: Node2D):
	if body.name == "Player" or body.is_in_group("player"):
		var inventory = get_tree().get_first_node_in_group("inventory_ui")
		if inventory and inventory.add_item(item_texture):
			queue_free()
