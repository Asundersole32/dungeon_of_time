extends CharacterBody2D

const SPEED = 300.0

var vertical_moviment := 0
var horizontal_moviment := 0

@onready var animated_sprite := $animated_player_sprits as AnimatedSprite2D

func _physics_process(delta: float) -> void:	
	var x_direction := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	if x_direction and y_direction:
		velocity.x = x_direction * SPEED
		velocity.y = y_direction * SPEED
	elif x_direction:
		horizontal_moviment = x_direction
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = x_direction * SPEED
	elif y_direction:
		vertical_moviment = y_direction
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = y_direction * SPEED
	else:
		horizontal_moviment = 0
		vertical_moviment = 0
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	_set_state()
	move_and_slide()
	
func _set_state():
	var actual_state := "idle_front"
	
	if vertical_moviment == -1:
		actual_state = "walking_up"
	elif vertical_moviment == 1:
		actual_state = "walking_down"
		
	if horizontal_moviment == 1:
		animated_sprite.set_flip_h(false)
		actual_state = "walking_side"
	elif horizontal_moviment == -1:
		animated_sprite.set_flip_h(true)
		actual_state = "walking_side"

	if animated_sprite.name != actual_state:
		animated_sprite.play(actual_state)
