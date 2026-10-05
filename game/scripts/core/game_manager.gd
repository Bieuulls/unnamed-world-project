# GameManager.gd
# Global Autoload / Singleton for Unnamed World Project
# Manages game state, debug overlays, pause, and community telemetry stubs.

extends Node

signal game_paused(is_paused: bool)
signal player_spawned(player_node: Node)

var is_paused: bool = false
var debug_mode: bool = false
var version: String = "0.1.0-alpha"

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	print_rich("[color=cyan][WORLD SYSTEM][/color] Initialized Godot 4 Core Engine v" + version)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_pause"):
		toggle_pause()
	elif event.is_action_pressed("toggle_debug"):
		debug_mode = !debug_mode
		print("[WORLD DEBUG] Debug overlay toggled: ", debug_mode)

func toggle_pause() -> void:
	is_paused = !is_paused
	get_tree().paused = is_paused
	emit_signal("game_paused", is_paused)
	if is_paused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
