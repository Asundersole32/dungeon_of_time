extends Area2D

class_name Door

var door_value := 0

@onready var door_detector := $door_detector as RayCast2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if door_detector.is_colliding():
		print("foi")

func _on_body_entered(body: Node2D) -> void:
	pass

func direction_setter(direction):
	if direction == "up":
		door_value = 4
		set_rotation(0)
	elif direction == "right":
		door_value = 3
		set_rotation_degrees(90)
	elif direction == "left":
		door_value = 2
		set_rotation_degrees(-90)
	elif direction == "down":
		door_value = 1
		set_rotation_degrees(180)
