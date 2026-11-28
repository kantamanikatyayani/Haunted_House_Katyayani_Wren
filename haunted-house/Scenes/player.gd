extends CharacterBody2D


@export var speed: float = 200.0
@export var acceleration: float = 0.05
@export var deceleration: float = 0.08
@onready var animated_sprite = $AnimatedSprite2D
@warning_ignore("unused_parameter")
func _physics_process(delta:float) -> void:
	get_input()
	
			
func get_input() -> void:
	if Input.is_action_pressed("Shift"):
		speed = 130
	else:
		speed = 95
	if Input.is_action_pressed("D"):
		velocity.x=lerp(velocity.x, speed, acceleration)
		animated_sprite.play("walk")
		$AnimatedSprite2D.flip_h = false
		
	elif Input.is_action_pressed("A"):
		velocity.x=lerp(velocity.x, -speed, acceleration)
		animated_sprite.play("walk")
		$AnimatedSprite2D.flip_h = true

	else:
		velocity.x=lerp(velocity.x, 0.0, deceleration)
	
	if Input.is_action_pressed("S"):
		velocity.y=lerp(velocity.y,speed,acceleration)
		animated_sprite.play("walk")
		
	elif Input.is_action_pressed("W"):
		velocity.y=lerp(velocity.y,-speed,acceleration)
		animated_sprite.play("walk")
		
	else:
		velocity.y=lerp(velocity.y,0.0,deceleration)
		
	
	
	move_and_slide()
