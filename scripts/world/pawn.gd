class_name Pawn
extends CharacterBody2D


export(PackedScene) var body_scene
export(PackedScene) var sprite_scene

# state
var controlled = false
var state = "idle" setget on_state_changed

# movement
## input
var input_dir = Vector2.ZERO
var input_rot = 0
var is_taking_bearing = false

## movement constants
@export var linear_walk_speed = 150
@export var linear_walk_acceleration = 300
@export var linear_deceleration = 500

## rotation constants
@export var angular_fast_speed = 120
@export var angular_slow_speed = 2

var linear_velocity = Vector2.ZERO

func _ready():
	if !body_scene:
		body_scene = PreLoader.BODY_DEFAULT
	if !sprite_scene:
		sprite_scene = PreLoader.SPRITE_DEFAULT
		
# keep process method simple to serve as an outline/overview of the whole script
func _physics_process(delta):
	update_state_machine()
	match state:
		"idle":
			update_movement(Vector2.ZERO, linear_deceleration)
		"walk":
			update_movement(linear_walk_speed, linear_walk_acceleration)
		"run":
			update_movement(linear_run_speed, linear_run_acceleration)
			
	update_rotation()
	update_animation_state()
	
	# linear_vel shouldn't be * delta? because of move and slide
	linear_velocity = body_instance.move_and_slide(linear_velocity)
	
	
func on_input_received(movement_dir, rotation_dir, is_control_pressed, is_shift_pressed):
	input_dir = movement_dir
	input_rot = rotation_dir
	is_taking_bearing = is_control_pressed
	is_running = is_shift_pressed
	
		
func update_state_machine():
	match state:
		"idle":
			if input_dir:
				self.state = "walk"
		"walk":
			if !input_dir:
				self.state = "idle"

		
			
func update_movement(target_speed, delta_speed):
	var delta = get_physics_process_delta_time()
	
	#translate input to direction relative to current body rotation
	var rotated_dir = input_dir.rotated(body_instance.rotation).normalized()
	
	# move toward velocity by delta speed
	linear_velocity = linear_velocity.move_toward(
			rotated_dir * target_speed, delta_speed * delta)
			
			
func update_rotation():
	var angular_speed
	if is_taking_bearing:
		# slow,precise for accurate bearing taking (0.5 degree/second)
		angular_speed = angular_slow_speed
	else:
		# fast, responsive rotation for movement (60 degree/second)
		angular_speed = angular_fast_speed
	# Q and E are pivot states, rotation may not belong here, 
	# it's visual thing, not server
	var delta = get_physics_process_delta_time()
	body_instance.rotation_degrees += input_rot * angular_speed * delta
	
	
	
func update_animation_state():
	if input_dir:
#		var unrotated_velocity = linear_velocity.rotated(-body_instance.rotation)
#		var target_pos = blend_pos.rotated(input_dir.angle())
#		blend_pos = blend_pos.rotated(-input_dir.rotated(body_instance.rotation).angle())
		
		var state_machine = sprite_instances[0].get_node("AnimationTree")
		state_machine.set("parameters/idle/blend_position", input_dir)
		state_machine.set("parameters/walk/blend_position", input_dir)
		state_machine.set("parameters/run/blend_position", input_dir)
		
		# flip sprite if going to the left
		if input_dir.x < 0:
			sprite_instances[0].flip_h = true
		else:
			sprite_instances[0].flip_h = false
		# linear velocity may be relative to rotation so brake sprite flip code

					
func on_status_changed(new_status):
	status = new_status
#	print(UID, " became ", status)
	
	
func on_state_changed(new_state):
	state = new_state
	var player_sprite = sprite_instances[0]
	player_sprite.playback.travel(state)
#	print(UID, " action: ", state)
