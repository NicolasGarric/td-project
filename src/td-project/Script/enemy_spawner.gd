extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_radius: float = 300  # distance de spawn du centre
@export var spawn_rate: float = 1.0    # ennemis/s

var timer: float = 0.0

func _process(delta: float) -> void:
	timer -= delta
	if timer <= 0.0:
		timer = 1.0 / spawn_rate
		spawn_enemy()

func spawn_enemy() -> void:
	var angle: float = randf() * TAU
	var spawn_offset: Vector2 = Vector2(cos(angle), sin(angle)) * spawn_radius
	var pos: Vector2 = get_parent().global_position + spawn_offset
	var enemy = enemy_scene.instantiate()
	enemy.global_position = pos
	enemy.rotation = angle
	get_parent().add_child(enemy)  # Instanciation sous `Game` pour que ../AllyShip fonctionne
