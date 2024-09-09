extends Area2D

const room_instance := preload("res://prefabs/room.tscn")

var door_value := 0

@onready var room_spawner := $room_spawn as Marker2D

func _on_body_entered(body: Node2D) -> void:
	pass

func direction_setter(direction):
	if direction == "up":
		door_value = 4
		set_rotation(0)
		room_spawner.set_position(Vector2(0, -191))
	elif direction == "right":
		door_value = 3
		set_rotation_degrees(90)
		room_spawner.set_position(Vector2(268, 0))
	elif direction == "left":
		door_value = 2
		set_rotation_degrees(-90)
		room_spawner.set_position(Vector2(-268, 0))
	elif direction == "down":
		door_value = 1
		set_rotation_degrees(180)
		room_spawner.set_position(Vector2(0, -191))
		
	print(room_spawner.get_position())
