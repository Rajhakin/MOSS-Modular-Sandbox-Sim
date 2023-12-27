extends PanelContainer


var agent_data : AgentData

@onready var label: Label = $MarginContainer/Label


func _ready() -> void:
	Events.agent_mouse_entered.connect(_on_agent_mouse_entered)
	

func _physics_process(delta: float) -> void:
	if agent_data:
		var text = "name: %s \nstatus: %s \nposition: %.v \nrotation: %.3f \nspeed: %s" % [
					agent_data.name, agent_data.current_status, agent_data.position, rad_to_deg(agent_data.rotation), "null"]
		label.text = text
	

func _on_agent_mouse_entered(data):
	agent_data = data
	
	
