extends Area2D

var projectile_speed = 250.00

var travelled_distance = 0.00
const RANGE = 1500.00

# Direction and movement
func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * projectile_speed * delta

	travelled_distance += projectile_speed * delta
	if travelled_distance > RANGE:
		queue_free()

# Signal
func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
