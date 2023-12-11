extends MarginContainer


var item_data: ItemData

@onready var button = $Button
@onready var value = $VBoxContainer/Value
@onready var amount = $VBoxContainer/Amount
@onready var texture_rect = $VBoxContainer/MarginContainer/TextureRect


func _ready():
	button.pressed.connect(on_button_pressed)
	button.mouse_entered.connect(on_mouse_entered)
	tooltip_text = item_data.name
	amount.text = str(item_data.amount)
	value.text = str(item_data.value)
	texture_rect.texture = item_data.texture


func on_mouse_entered():
	AudioManager.play(PreLoader.PIPBOY_HIGHLIGHT)


func on_button_pressed():
	AudioManager.play(PreLoader.PIPBOY_MODE)





	
	
	
	
	
	
	
	
	
	
	
	
	
