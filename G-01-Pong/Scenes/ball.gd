extends CharacterBody2D

var direction = Vector2.LEFT #Vector2(-1, 0)
var speed = 500.0

func _physics_process(delta):
	var collision_info = move_and_collide(direction * speed * delta)
	if collision_info:
		if collision_info.get_collider().is_in_group("paddle"):
			var paddle_position = collision_info.get_collider().global_position
			var collision_position = collision_info.get_position()
			direction = reverse_direction(paddle_position)
			direction = direction.rotated(get_angle(collision_position, paddle_position) * direction.x)
		else:
			direction = direction.bounce(collision_info.get_normal())


func reverse_direction(paddle_position):
	return Vector2(
		1 if (global_position.x > paddle_position.x) else -1,
		0
	)


func get_angle(collision_position, paddle_position):
	var segment = (collision_position.y - paddle_position.y) / 50
	var new_angle = segment * 45
	return deg_to_rad(new_angle)








