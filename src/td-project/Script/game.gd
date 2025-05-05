extends Node2D

var spawner_delay = 0.55

func spawn_enemy():
	var new_enemy = preload("res://Scene/enemy_ship.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)


func _on_timer_spawner_timeout() -> void:
	%TimerSpawner.wait_time = spawner_delay
	spawn_enemy()


func _on_ally_ship_health_depleted() -> void:
	%GameOver.visible = true # Set layer to visible
	get_tree().pause = true # Pause the game
