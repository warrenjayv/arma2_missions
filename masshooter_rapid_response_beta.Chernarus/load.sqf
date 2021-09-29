
/* wait for init to finish */

/* execute vehicle is landed. */
_return = true;


while { (alt < 10) && (_return) } do 
{

     //#unit action ["moveToCargo", targetVehicle, cargoPosition]//
	 
	 if ( driver ownship == copilot ) then {
	 
		//player globalChat "pilot checked"; 
		
		
		/// command the special units to enter chopper ///
	    _specs = [];
		_specs = units spec_grp; 
		
		///command enter vehicle /// 
		spec_grp addVehicle ownship; 
		_specs orderGetIn true;
		
		/************************
		for "_i" from 0 to 4 do {
			//(_specs select _i) setBehaviour "CARELESS";
			
			player globalChat (name (_specs select _i));
		}; //for{} 
		**************************/
		
		 _return = false;
		
	 };
	 

};