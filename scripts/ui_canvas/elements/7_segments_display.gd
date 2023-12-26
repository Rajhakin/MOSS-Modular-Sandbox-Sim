extends PanelContainer


@export_enum("None","Thousand Separation", "Date", "Time") var display_type = "None"
# could use for date and time as well
@export var visible_characters = 3 #placeholder.length? better remove placeholder altogheter

var characters_limit = 11
var value:
	set(_value):
		value = _value
		value_label.text = format_value(value)

@onready var background_label: Label = $HBoxContainer/BackgroundLabel
@onready var value_label: Label = $HBoxContainer/BackgroundLabel/ValueLabel


func _ready() -> void:
	match display_type:
		"Thousand Separation":
			background_label.text = "888.888.888".substr(characters_limit - visible_characters) 
			
		"Date":
			background_label.text = "88-88-88"
		"Time":
			background_label.text = "88:88"
	#var place_values = format.count("%")
	#var values_array : Array = []
	#for i in place_values:
		#values_array.append(888888)
	#print(values_array)
	#background_label.text = format % values_array
	

	
func format_value(value) -> String:	
	var formated_str = ""
	
	match display_type:
		"Thousand Separation":
			var rounded_value = int(value)
			var str_value = str(rounded_value)
			
			if (rounded_value > 999_999_999):
				return "too long"
			
			if (rounded_value > 999):
				formated_str = str_value.insert(str_value.length() - 3, ".")
				if (rounded_value > 999_999):
					formated_str = formated_str.insert(str_value.length() - 6, ".")
			else:
				formated_str = str_value
			
			var padded_str = formated_str.lpad(characters_limit)
			var trimmed_str = padded_str.substr(characters_limit - visible_characters) 
			formated_str = trimmed_str
			

		"Date":
			formated_str = "%02d-%02d-%s" % [value[0], value[1], str(value[2]).erase(0, 2)]
		"Time":
			formated_str = "%02d:%02d" % [value[0], value[1]]
	
	return formated_str
	
