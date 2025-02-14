extends Node2D

var money = 25
var wave = 0
var mobs_left = 0
var wave_mobs = [5, 10, 25, 50, 80, 0]
var wave_speed = [1, 1, 1, 1, 1]

var instance
var enemy = preload("res://Art/enemy8x8.png")

func _ready() -> void:
	%WaveTimer.start()


func _on_wave_timer_timeout() -> void:
	mobs_left = wave_mobs[wave]
	%EnemyTimer.wait_time = wave_speed[wave]
	%EnemyTimer.start()

func _on_enemy_timer_timeout() -> void:
	instance = enemy.instance()
	$Path2D.add_child(instance)
	mobs_left -= 1
	if mobs_left <= 0:
		%EnemyTimer.stop()
		wave += 1
		if wave < len(wave_mobs):
			%WaveTimer.start()
		else:
			get_tree().change_scene_to_file("res://Scene/win.tscn")
