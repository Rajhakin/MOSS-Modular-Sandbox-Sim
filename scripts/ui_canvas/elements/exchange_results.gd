extends PanelContainer


@onready var confirm_button = $NetChange/ConfirmationDialog/HBoxContainer2/Deal
@onready var cancel_button = $NetChange/ConfirmationDialog/HBoxContainer2/Leave


func _ready():
	confirm_button.mouse_entered.connect(on_button_mouse_entered.bind(confirm_button.disabled))
	cancel_button.mouse_entered.connect(on_button_mouse_entered.bind(cancel_button.disabled))
	confirm_button.pressed.connect(on_button_pressed.bind(confirm_button))
	cancel_button.pressed.connect(on_button_pressed.bind(cancel_button))
	toggle_button(confirm_button)

	
func on_button_pressed(button):
	match button:
		confirm_button:
			AudioManager.play(PreLoader.PIPBOY_MODE)
			AudioManager.play(PreLoader.LOOT)
		cancel_button:
			AudioManager.play(PreLoader.PIPBOY_MODE)
	

func on_button_mouse_entered(is_disabled):
	if is_disabled == false:
		AudioManager.play(PreLoader.PIPBOY_HIGHLIGHT)
	
# TODO: make CustomButton a scene and move the disable func inside
#	might keep code to play sound inside as well, export stream
func toggle_button(button):
	button.disabled = !button.disabled
	# TODO: change label color


func on_exchange_container_changed():
	pass
	# check if deal is valid, if is unlock deal button

# rather than disable when invalid transaction, make so transaction is always 

func process_transaction():
	pass
