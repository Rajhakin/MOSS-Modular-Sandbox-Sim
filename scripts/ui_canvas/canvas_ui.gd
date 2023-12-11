extends CanvasLayer

"""
either travel or blur
on overlap or setting, pause and blur
pause does not blur, blur os Screens show, before fading in
	
other than buttons, clicking on blur or right mouse close menu

let screens fade out themselves on close pressed and emit closed
or CanvasUI handle it?

PDA old margin = 200 on all sides, leaving this here until we have a world 
	to overlay PDA over

calendar might be useful rather than journal/quest log

old radios were mono, should PDA sound be too?
"""	

var user_agent:
	set(value):
		user_agent = value
		exchange_screen.user_agent_inv = value.inv_data
		
@onready var pda = $PDA	
@onready var travel_screen = $TravelScreen
@onready var map_screen = $PDA/MapScreen
@onready var caravan_screen = $PDA/CaravanScreen
@onready var town_screen = $PDA/TownScreen
@onready var exchange_screen = $PDA/ExchangeScreen
@onready var main_menu_screen = $MainMenuScreen
@onready var settings_screen = $PDA/SettingsScreen

@onready var current_screen = travel_screen


func _ready():
	var screens = [travel_screen, map_screen, caravan_screen, town_screen, exchange_screen]
	for i in screens:
		if i.has_signal("button_pressed"):
			i.button_pressed.connect(on_travel_screen_button_pressed)

	# escape should call current screen close/fade out unless travel screen
func on_travel_screen_button_pressed():
	pass
	

func on_user_agent_area_entered(area):
	toggle_pause()
	
	if area is Location:
		switch_screen(town_screen)
	elif area is Agent:
		switch_screen(exchange_screen)
		exchange_screen.populate_inventories(area.inv_data)


func toggle_pause():
	get_tree().paused = not get_tree().paused


func switch_screen(new_screen):
	AudioManager.play(PreLoader.PIPBOY_STATIC)		
	# return signal or animation time so we know when fade in the next screen
	var fade_out_duration = current_screen.fade_out()
	await get_tree().create_timer(fade_out_duration).timeout
	new_screen.fade_in()
	current_screen = new_screen


