extends Marker2D

var target : Node2D

var zoom_default := Vector2(2, 2)
var zoom_min : Vector2  = zoom_default * 0.25
var zoom_max : Vector2 = zoom_default
var zoom_speed : Vector2 = zoom_default * 0.1

var drag_sensitivity : float = 1.0

@onready var camera_2d : Camera2D = $Camera2D


func _input(event: InputEvent) -> void:
	if not target:
		if event is InputEventMouseMotion \
				and Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			#var wrap_margin = 10
			var screen_boundaries = get_viewport_rect().size
			var mouse_pos = get_viewport().get_mouse_position()
			#print(range(screen_boundaries.x))

			if (int(mouse_pos.x) not in range(screen_boundaries.x +1)) \
					or (int(mouse_pos.y) not in range(screen_boundaries.y +1)):
						
				print("out of boundaries, mouse pos: %.v screen boundaries: %.v" % [mouse_pos, screen_boundaries] )
				mouse_pos.x = wrap(mouse_pos.x, 0, screen_boundaries.x)
				mouse_pos.y = wrap(mouse_pos.y, 0, screen_boundaries.y)
				
				#get_viewport().warp_mouse(mouse_pos)
				
			else:
				position -= event.relative.rotated(rotation) * drag_sensitivity / camera_2d.zoom
				
		elif not Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			
			
			
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				camera_2d.zoom -= zoom_speed
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				camera_2d.zoom += zoom_speed
				
			camera_2d.zoom = camera_2d.zoom.clamp(zoom_min, zoom_max)


func _ready() -> void:
	Events.user_agent_set.connect(_on_user_agent_set)


func _physics_process(delta : float) -> void:
	if target:# if instance valid? in case of deletion
		position = target.position
		rotation = target.rotation

		

func _on_user_agent_set(agent):
	target = agent
