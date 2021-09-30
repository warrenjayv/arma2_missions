
/* wait for init to finish */

/* execute vehicle is landed. */
_return = true;

/* reference spec ops */
 _specs = [];
 _specs = units spec_grp; 
		
while { (alt < 10) && (_return) } do 
{

     // unit action ["moveToCargo", targetVehicle, cargoPosition] //
	 
	 /// command the special units to enter chopper ///
	 if ( driver ownship == copilot ) then {
	 
		//player globalChat "pilot checked"; 
		 
		/// command enter vehicle /// 
		spec_grp addVehicle ownship; 
		_specs orderGetIn true;
		
		/************************
		for "_i" from 0 to 4 do {
			//(_specs select _i) setBehaviour "CARELESS";
			
			player globalChat (name (_specs select _i));
		}; //for{} 
		**************************/
		
	 };
	 
	 /// command special units to leave chopper ///
	 
	 if ( driver ownship != copilot ) then {
	     
        _specs orderGetIn false; 		 
	   
	 };
	 
	 sleep 2; 

};