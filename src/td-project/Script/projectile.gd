extends RigidBody2D

enum State { Flying, Hit }
var state = State.Flying

func _ready() -> void:
	# Détruire après 2s
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _on_Projectile_body_entered(body: Node) -> void:
	if body.is_in_group("Enemy"):
		state = State.Hit
		queue_free()
