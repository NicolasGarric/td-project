extends CharacterBody2D

@onready var ally = get_node("../AllyShip")

var enemySpeed = 100.0
var enemyHealth = 3.00

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(ally.global_position)
	velocity = direction * enemySpeed
	move_and_slide()


func take_damage():
	enemyHealth -= 1
	
	if enemyHealth == 0.00:
		queue_free()
