extends Area2D

var health = 100.00
var fire_rate = 0.25

func _physics_process(_delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_closest_enemy = enemies_in_range[0]
		look_at(target_closest_enemy.global_position)


func shoot():
	const ALLY_PROJECTILE = preload("res://Scene/ally_projectile.tscn")
	var new_ally_projectile = ALLY_PROJECTILE.instantiate()
	new_ally_projectile.global_position = %ShootingPoint.global_position
	new_ally_projectile.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_ally_projectile)


func _on_fire_rate_timeout() -> void:
	var enemies_in_range = get_overlapping_bodies()
	%FireRate.wait_time = fire_rate
	if enemies_in_range.size() > 0:
		shoot()
