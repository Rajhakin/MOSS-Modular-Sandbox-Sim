extends HBoxContainer


var item_data: ItemData

@onready var texture_button = $PanelContainer/Button
@onready var decrease_button = $VBoxContainer/HBoxContainer/DecreaseButton
@onready var increase_button = $VBoxContainer/HBoxContainer/IncreaseButton
@onready var slider = $VBoxContainer/HBoxContainer/HSlider
@onready var label = $VBoxContainer/Label
@onready var texture_rect = $PanelContainer/TextureRect


func _ready():
	texture_button.mouse_entered.connect(on_button_mouse_entered.bind(texture_button))
	texture_button.pressed.connect(on_button_pressed.bind(texture_button))
	increase_button.pressed.connect(on_button_pressed.bind(increase_button))
	decrease_button.pressed.connect(on_button_pressed.bind(decrease_button))
	slider.value_changed.connect(onSliderValueChanged)
	
	texture_button.tooltip_text = item_data.name
	slider.max_value = item_data.amount
	texture_rect.texture = item_data.texture


func on_button_mouse_entered(button):
	match button:
		texture_button:
			AudioManager.play(PreLoader.PIPBOY_HIGHLIGHT)


func on_button_pressed(button):
	match button:
		texture_button:
			AudioManager.play(PreLoader.PIPBOY_MODE)
			queue_free()
		increase_button:
			slider.value += 1
			AudioManager.play(PreLoader.PIPBOY_MODE)
			
		decrease_button:
			slider.value -= 1
			AudioManager.play(PreLoader.PIPBOY_MODE)

			
func onSliderValueChanged(newValue):
	label.text = str(newValue)
	# on slider, scroll, and button we change same variable, set get, 
	#	so no matter how change trigger signal to update deal validity
