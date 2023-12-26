extends Node

# responsibilties:
# pause/game state 
# connections between world and ui
# save and load for now

@onready var travel_screen = $CanvasUI/TravelScreen
@onready var canvas_ui = $CanvasUI
@onready var camera = $World/CameraPivot


func _ready():
	load_state()# move to init?
	#get_tree().paused = true
	

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_state()
		print("Close Requested")


func load_state():
	pass


func save_state():
	pass
	
	
