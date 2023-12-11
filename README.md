MOSS-Modular-Sandbox-Sim
 

how pass pawn rotation to ui?
	connect on rotation changed to ui's on rotation changed
	or input event resource/command pattern? 
	or rather, change with user input, user input sets ui and agent rotation
		connect user input to ui and user_agent
	actually movement so far means click, set click angle to ui and agent sprite
	and that prime agent to move forward, that's all it need to do, 
	on click, set direction, unpause, 
	user agent could be always moving forward, and just pause/unpause world
	don't think that's how M&B movement works, on click unpause, on hold space 
	also unpause game for as long as it's pressed, but don't move forward, so
	no aways moving forward, 
	locatins are always visible there, known, not here, there it moves to mouse
	click position, not here, 
	so, on click, we set ui first, since ui handles the click, then emit signal
	when click is approved/valid so can set agent destination and unpause world
	
	only player should check for overlap? agents shouldnt even have areas2d?
	could system not work for both, 
	
	agents do not ented town, but colide with it, stay in radius to access
	allow player to see who's in there and deal with them
	M&B had notables NPC panel, we could have one showing wich caravans are there
	so they don't just vanish, become out of reach, can't attack them
	not very realistic, maybe do both have interface for ease of use so don't
	need to bump into each or hover mouse to see who they are and what have to offer
	 

consider eference scene and resource paths using:
	export var resource_inst : Resource
	rather than using Strings, or this preloader autoload
	so paths don't brake when moving things
	
export(NodePath) var node_var_name: NodePath

consider resources as subforlder under relevant folder rather than general
	folder containg all resources

 consider keeping all assets in one folder

godot is hibrid of inheritance and composition
components inherit behavior from other components

will screens be aways loaded or intenced on demand?

should we separated data from visual/game world and ui?	
	makes serialization easier, all data is in one place
	can just spawn things again using stored data

	use resources?
	use objects/refcounted?
		can be referenced, can't run logic, only be changed by other nodes?
	use node? keep data in main
		on object creation make resective node,
		add node to data tree
		assign to game object, 
		add game object to world tree
	put inside visual object, object draw data from it
		game object run logic and update data object? or the other way around?
		update the data, automaticaly update game object since game object is 
		listenting, processing inputs contained in the data
		
	see how mantequilla and quill18 did it
	
