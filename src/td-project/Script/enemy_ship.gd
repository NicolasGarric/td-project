extends CharacterBody2D

@export var speed: float = 100

func _physics_process(delta: float) -> void:
	# Calcul de la direction vers le vaisseau allié
	var ship = get_node("../AllyShip")
	var dir: Vector2 = (ship.global_position - global_position).normalized()
	# Utilisation de la propriété intégrée 'velocity' de CharacterBody2D
	velocity = dir * speed
	move_and_slide()
	# Rotation pour faire face à la cible
	rotation = dir.angle()

# Signal appelé par le Hitbox (Area2D)
func _on_Hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("Projectile"):
		body.queue_free()
		queue_free()
