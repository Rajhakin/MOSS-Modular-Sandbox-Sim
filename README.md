MOSS-Modular-Sandbox-Sim
 
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
