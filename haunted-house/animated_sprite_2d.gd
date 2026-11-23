extends AnimatedSprite2D

func _ready():
	# Plays your 3-frame floating movement by default
	play("normal")

func _input(event):
	# Press SPACEBAR to test switching animations and fading
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		start_fading()

func start_fading():
	# 1. Switch to your 5-frame sequence (currently named "default" in your list)
	play("fading")
	
	# 2. Fade the transparency down to 0 over 1 second
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	
	# 3. Optional: Delete the enemy completely once it finishes fading out
	tween.tween_callback(get_parent().queue_free)
