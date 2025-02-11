extends Node2D

@onready var tower_head_16x_16: Sprite2D = %TowerHead_16x16

var enemies = []

var current_enemy

func _physics_process(delta: float) -> void:
	if enemies != []:
		current_enemy = enemies[0]
		tower_head_16x_16.look_at(current_enemy.global_position)

func _on_tower_16x_16_range_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		enemies.append(area)

func _on_tower_16x_16_range_area_exited(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		enemies.erase(area)
