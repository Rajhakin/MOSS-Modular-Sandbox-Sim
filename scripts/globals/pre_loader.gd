extends Node
# when file paths change we update here only, no need to look every script after
# 	broken references
# should we ditch node paths and use export to keep track of resource reference?

# UI/ELEMENTS
const INVENTORY_ITEM = preload("res://scenes/ui_canvas/elements/inventory_item.tscn")
const EXCHANGE_ITEM = preload("res://scenes/ui_canvas/elements/exchange_item.tscn")
# WORLD/UNITS
const AGENT = preload("res://scenes/world/units/agent.tscn")
const USER_AGENT = preload("res://scenes/world/units/user_agent.tscn")

# SOUND/INTERFACE
# caravaneer is inspired in the classic fallout games, interface included?
# make ui design inpired by it, just texture, don't actually make it too 
# accurate to source material down to flaws, clunky like modern clones like Atom

# SOUND/INTERFACE/MENU
# use vats for menu or PDA, sounds more interesting than default menusfx
# look up iddle animations, remember blacksmith, scratinchg back, push up, pipboy folders, migbt
#be useful to iddle caravan sounds

# SOUND/INTERFACE/SCREENS
const MENU_FOCUS = preload("res://assets/audio/sfx/ui/menu/ui_menu_focus.wav")
const MENU_OK = preload("res://assets/audio/sfx/ui/menu/ui_menu_ok.wav")
const MENU_CANCEL = preload("res://assets/audio/sfx/ui/menu/ui_menu_cancel.wav")
const MENU_PREVNEXT = preload("res://assets/audio/sfx/ui/menu/ui_menu_prevnext.wav")

const PIPBOY_HUM = preload("res://assets/audio/sfx/ui/pipboy/ui_pipboy_hum_lp.wav")
const PIPBOY_HIGHLIGHT = preload("res://assets/audio/sfx/ui/pipboy/ui_pipboy_highlight.wav")
const PIPBOY_SELECT = preload("res://assets/audio/sfx/ui/pipboy/ui_pipboy_select.wav")
const PIPBOY_MODE = preload("res://assets/audio/sfx/ui/pipboy/ui_pipboy_mode.wav")
const PIPBOY_LIGHT_ON = preload("res://assets/audio/sfx/ui/pipboy/ui_pipboy_light_on.wav")
const PIPBOY_LIGHT_OFF = preload("res://assets/audio/sfx/ui/pipboy/ui_pipboy_light_off.wav")
const PIPBOY_STATIC = preload("res://assets/audio/sfx/glitch.tres")

# mission passed, +respect
const PIMPBOY = preload("res://assets/audio/sfx/ui/ui_pimpboy.wav")

### ELEMENTS
const LOOT = preload("res://assets/audio/sfx/items/ui_items_takeall.wav")


### RADIO
const RADIO_STATIC = preload("res://assets/audio/sfx/ui/computers/consoles/emt_controlconsole03_lp.ogg")
### DEBUG
const HACKING_ENTER_KEY_PRESSED = preload("res://assets/audio/sfx/hacking_key_pressed.tres")
const HACKING_KEY_PRESSED = preload("res://assets/audio/sfx/hacking_enter_pressed.tres")
const HACKING_ACCEPTED = preload("res://assets/audio/sfx/ui/hacking/ui_hacking_passgood.wav")
const HACKING_DENIED = preload("res://assets/audio/sfx/ui/hacking/ui_hacking_passbad.wav")

## AMBIENCE
#	indistinguishible, wind, sand, noise, 
## ENVIRONMENT 
#	is distinguishable, things around
## OBJECTS
#	 are interactibles

## FOOTSTEPS
### DIRT
const FOOTSTEP_DIRT_SNEAK = preload("res://assets/audio/sfx/footsteps_dirt_sneak.tres")

### ROAD
# solid concrete?
### WATER
### BRIDGE
# wood?
### BRAHMIN
### TWIG


