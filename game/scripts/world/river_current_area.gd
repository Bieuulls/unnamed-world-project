# RiverCurrentArea.gd
# Demonstrates physical river current pushing bodies downstream.
# An indifferent nature system: water currents exert continuous physical drag.

class_name RiverCurrentArea
extends Area3D

@export var flow_direction: Vector3 = Vector3(0.0, 0.0, 1.0)
@export var current_strength: float = 6.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("apply_river_current"):
		print("[RIVER] Body entered water current: ", body.name)
		if "is_in_water" in body:
			body.is_in_water = true
		body.apply_river_current(flow_direction.normalized() * current_strength)

func _on_body_exited(body: Node3D) -> void:
	if body.has_method("clear_river_current"):
		print("[RIVER] Body left water current: ", body.name)
		if "is_in_water" in body:
			body.is_in_water = false
		body.clear_river_current()
