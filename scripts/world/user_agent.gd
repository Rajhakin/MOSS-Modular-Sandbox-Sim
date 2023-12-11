extends Agent
class_name UserAgent

##@deprecated
"""
UserAgent handles user's input 

hangle input outside user agent so we can pause world

pause manager

speed options buttons

on overlap, emit signal, pause world, on ui close, 

idle state
	after exiting town/trader
	
travel state
	auto resume after ui closed
	all screens but town exit trigger this


is there any reason to have a hold space to wait? 
 or we always moving forward and only toggling pause to halt/go?

- if not moving look at mouse


bearing is taken from north/looking to north
	must look north first before adding map plot angle

rotate canvas transform default rotation rather than every canvas items
lets not rotate anything but user_agent for now until we understand things

create input event resource or use godot's InputEvent? 
agent input would have things like is_shift, is_control, click, motion, godot
already has input event class, we could .new() and just fill template
the advantage of resource over InputEvent.new() is that we could pass more things
might as well just inherit InputEvent and make CustomInputEvent class

physics and visuals server
2 type of object sprites, 
	1. fixed rotation go into visual server and have position updated  
		like trees
	2. normal rotation stay in physics object 
		like agents arrow sprites
physics layer rotate with pivot set as UserAgent position, so world rotate around
UserAgent, figure out how set sprite position, consider remote transform, and top level property
"""

signal moved(position)
signal overlaped(area)


#func _unhandled_input(event):
#	if event is InputEventMouseButton:
#		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
#			set_course()

	
		
func _physics_process(delta):
	move_forward(delta)
	

func move_forward(delta):
	position += transform.x * 100 * delta
	moved.emit(position)


# send position instead and let agent handle it?
func on_travel_screen_clicked(agent_to_mouse_dir):
	print("agent input dir = ", agent_to_mouse_dir)
	set_course(agent_to_mouse_dir)


func set_course(direction):
	var angle_to_mouse = (get_global_mouse_position() - global_position).angle()
	facing_dir = angle_to_mouse
	# not set but add difference?
	rotation = angle_to_mouse
	# Sprite and Camera inherits parent rot so we subtract to keep their 
	# original rot so they lerp to new rot instead 
	
	# rotated(-rot)? unrotate()?

	print("course set")
	






