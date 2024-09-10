extends Area2D

class_name Door

var door_value := 0

const room_instance := preload("res://prefabs/room.tscn")

@onready var room_spawner := $room_spawn as Marker2D
@onready var door_detector := $door_detector as RayCast2D

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	spawn_room()

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
		

func spawn_room():
	print(room_instance)
	var room := room_instance.instantiate()
	get_parent().call_deferred("add_child", room)
	room.global_position = room_spawner.position
