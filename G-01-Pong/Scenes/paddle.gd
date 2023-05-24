extends CharacterBody2D

@export var control_up = "left_up"
@export var control_down = "left_down"
var speed = 500.0

func _physics_process(delta):
	var direction = Vector2(
		0,
		Input.get_axis(control_up, control_down)
	)
	
	var collision_info = move_and_collide(direction * speed * delta)
