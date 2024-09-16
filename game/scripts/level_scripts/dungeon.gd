extends Node2D

var dungeon_room
var dungeon_player

@onready var dungeon_spawn := $dungeon_spawn as Marker2D

func _ready() -> void:
	spawn_room()
	spawn_player()
	
func _process(delta: float) -> void:
	pass

func spawn_room():
	dungeon_room = GameMenager.create_room()
	dungeon_room.position = dungeon_spawn.global_position
	
func spawn_player():
	dungeon_player = GameMenager.create_player()
	dungeon_player.position = dungeon_spawn.global_position
