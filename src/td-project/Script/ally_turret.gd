extends Node2D

@export var shoot_interval: float = 0.5
@export var projectile_scene: PackedScene
var cooldown: float = 0.0

func _process(delta: float) -> void:
	# Cible = vaisseau central (deux niveaux au-dessus)
	var ship = get_parent().get_parent()
	if ship == null:
		return

	# Orientation de la tourelle vers la cible
	var direction: Vector2 = (ship.global_position - global_position).normalized()
	rotation = direction.angle()

	# Gestion du cooldown et tir
	cooldown -= delta
	if cooldown <= 0.0:
		cooldown = shoot_interval
		shoot(direction)

func shoot(direction: Vector2) -> void:
	var projectile = projectile_scene.instantiate() as RigidBody2D
	# Placement du projectile à la bouche du canon
	projectile.global_position = $Muzzle.global_position
	projectile.rotation = direction.angle()

	# Ajout dans la scène active
	get_tree().current_scene.add_child(projectile)

	# Vitesse initiale du projectile
	projectile.linear_velocity = direction * 400.0  # ajuster selon besoins
