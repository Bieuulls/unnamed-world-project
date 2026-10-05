# PlayerController.gd
# Realistic human locomotion, camera control, and stamina system
# Aligned with the 'Indifferent Nature' pillar: human limitations, weight, and stamina.

class_name PlayerController
extends CharacterBody3D

@export_group("Movement Speeds")
@export var walk_speed: float = 3.8
@export var sprint_speed: float = 6.5
@export var crouch_speed: float = 2.0
@export var acceleration: float = 8.0
@export var deceleration: float = 10.0
@export var jump_impulse: float = 4.2

@export_group("Camera Settings")
@export var mouse_sensitivity: float = 0.002
@export var min_pitch: float = -80.0
@export var max_pitch: float = 85.0

@export_group("Stamina System")
@export var max_stamina: float = 100.0
@export var stamina_drain_rate: float = 18.0
@export var stamina_regen_rate: float = 12.0
@export var stamina_recovery_delay: float = 1.2

@onready var camera_pivot: Node3D = $CameraPivot
@onready var camera: Camera3D = $CameraPivot/Camera3D

var current_stamina: float = 100.0
var stamina_timer: float = 0.0
var is_sprinting: bool = false
var is_in_water: bool = false
var external_force: Vector3 = Vector3.ZERO
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity", 9.8)

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	current_stamina = max_stamina

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		# Rotate body horizontally (yaw)
		rotate_y(-event.relative.x * mouse_sensitivity)
		# Rotate camera vertically (pitch)
		camera_pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		camera_pivot.rotation.x = clamp(
			camera_pivot.rotation.x,
			deg_to_rad(min_pitch),
			deg_to_rad(max_pitch)
		)

func _physics_process(delta: float) -> void:
	handle_stamina(delta)
	handle_movement(delta)

func handle_movement(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jump logic
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		if current_stamina >= 10.0:
			velocity.y = jump_impulse
			current_stamina -= 10.0
			stamina_timer = stamina_recovery_delay

	# Determine input direction
	var input_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var move_direction: Vector3 = (transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()

	# Determine target speed
	var target_speed: float = walk_speed
	var wants_sprint: bool = Input.is_action_pressed("sprint") and input_dir.y < 0.0 # sprint forward only

	if wants_sprint and current_stamina > 5.0 and is_on_floor():
		is_sprinting = true
		target_speed = sprint_speed
	else:
		is_sprinting = false

	# Accelerate / Decelerate smoothly
	if move_direction != Vector3.ZERO:
		velocity.x = move_toward(velocity.x, move_direction.x * target_speed, acceleration * delta)
		velocity.z = move_toward(velocity.z, move_direction.z * target_speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0.0, deceleration * delta)
		velocity.z = move_toward(velocity.z, 0.0, deceleration * delta)

	# Apply external environmental forces (e.g. river current)
	velocity += external_force * delta

	move_and_slide()

func handle_stamina(delta: float) -> void:
	if is_sprinting:
		current_stamina = max(0.0, current_stamina - stamina_drain_rate * delta)
		stamina_timer = stamina_recovery_delay
	else:
		if stamina_timer > 0.0:
			stamina_timer -= delta
		else:
			current_stamina = min(max_stamina, current_stamina + stamina_regen_rate * delta)

func apply_river_current(force_vector: Vector3) -> void:
	external_force = force_vector

func clear_river_current() -> void:
	external_force = Vector3.ZERO
