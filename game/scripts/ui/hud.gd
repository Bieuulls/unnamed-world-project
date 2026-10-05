# hud.gd
# Minimalist, immersive HUD for Unnamed World Project
# Shows crosshair dot and dynamic stamina bar without screen clutter.

extends Control

@onready var stamina_bar: ProgressBar = $MarginContainer/VBoxContainer/StaminaBar
@onready var prompt_label: Label = $MarginContainer/VBoxContainer/PromptLabel

var player_ref: Node = null

func _ready() -> void:
	await get_tree().process_frame
	player_ref = get_tree().get_first_node_in_group("player")

func _process(_delta: float) -> void:
	if player_ref and "current_stamina" in player_ref:
		stamina_bar.value = player_ref.current_stamina
		# Hide bar when full to preserve clean cinematic immersion
		stamina_bar.visible = player_ref.current_stamina < (player_ref.max_stamina - 0.5)
