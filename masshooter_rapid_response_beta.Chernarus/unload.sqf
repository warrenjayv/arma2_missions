
/// UNLOAD /// 

	// command special units to leave chopper //
	
	 /* reference spec ops */
	_specs1 = [];
	_specs1 = units spec_grp; 
	
	while { true } do {
		 
		if ( driver ownship != copilot ) then {
		
		    //spec_grp leaveVehicle ownship; 
			_specs1 orderGetIn false;
			
			
		};
		
		spec_grp move (position copilot); 
		
		sleep 1; 
	}; 