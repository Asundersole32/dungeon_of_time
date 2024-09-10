extends CharacterBody2D

const door_instance := preload("res://prefabs/door.tscn")

var rng_door := RandomNumberGenerator.new()
var door_instances := []

@export var room_event := Event
@export var entered_door := 0

@onready var right_door_spawn := $right_door_spawn as Marker2D
@onready var left_door_spawn := $left_door_spawn as Marker2D
@onready var upper_door_spawn := $upper_door_spawn as Marker2D
@onready var lower_door_spawn := $lower_door_spawn as Marker2D

@onready var upper_door_detector := $upper_door_detector as RayCast2D
@onready var lower_door_detector := $lower_door_detector as RayCast2D
@onready var right_door_detector := $right_door_detector as RayCast2D
@onready var left_door_detector := $left_door_detector as RayCast2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
	
func room_door_creator():
	var door = door_instance.instantiate()
	get_parent().call_deferred("add_child", door)
	return door
	
func room_doors_instances():
	var left := rng_door.randi_range(0, 1)
	var right := rng_door.randi_range(0, 1)
	var down := rng_door.randi_range(0, 1)
	var up := rng_door.randi_range(0, 1)
	
	var direction 
	
	if up == 1 or entered_door == 1:
		var created_door = room_door_creator()
		direction = "up"
		created_door.global_position = upper_door_spawn.position
		created_door.call_deferred("direction_setter", direction)
		door_instances.append(created_door)
		
	if right == 1 or entered_door == 2:
		var created_door = room_door_creator()
		direction = "right"
		created_door.global_position = right_door_spawn.position
		created_door.call_deferred("direction_setter", direction)
		door_instances.append(created_door)
		
	if left == 1 or entered_door == 3:
		var created_door = room_door_creator()
		direction = "left"
		created_door.global_position = left_door_spawn.position
		created_door.call_deferred("direction_setter", direction)
		door_instances.append(created_door)
		
	if down == 1 or entered_door == 4:
		var created_door = room_door_creator()
		direction = "down"
		created_door.global_position = lower_door_spawn.position
		created_door.call_deferred("direction_setter", direction)
		door_instances.append(created_door)


func _on_insider_room_area_body_entered(body: Node2D) -> void:
	room_doors_instances()
