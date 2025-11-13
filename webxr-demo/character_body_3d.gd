extends CharacterBody3D

@onready var left_controller = $XROrigin3D/XRController3D_Left
@onready var right_controller = $XROrigin3D/XRController3D_Right
@onready var head = $XROrigin3D/XRCamera3D

var speed := 3.0

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	input_vector = input_vector.normalized()

	var direction = (head.global_transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()
