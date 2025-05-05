extends Node

signal health_depleted

var health = 100

func _physics_process(delta: float) -> void:
	# Don't move
	var direction = null
	var velocity = null

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %AllyShip_HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0:
			health_depleted.emit()
