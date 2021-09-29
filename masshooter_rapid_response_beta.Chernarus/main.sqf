/*  mi24_training_day_script
 *  :: initialization file (per player)
 */
 
/// initializations ///
_strings = []; 
alt = 0; 

/// ownship ///
ownship flyInHeight 100;  // default
ownship addEventHandler ["GetIn", "hint 'entered vehicle'"];

/// spawn the spec ops /// 

spec_grp = createGroup east;
specs = []; 

_spec_officer = spec_grp createUnit [ "RU_Soldier_Officer", getPos player, [], 0, "FORM"]; 
_spec_rifle = spec_grp createUnit [ "RU_Soldier_Crew", getPos player, [], 0, "FORM" ];
_spec_sniper = spec_grp createUnit [ "RU_Soldier_Sniper", getPos player, [], 0, "FORM" ]; 
_spec_medic = spec_grp createUnit [ "RU_Soldier_Medic", getPos player, [], 0, "FORM" ];

specs set [ 0, _spec_officer ];
specs set [ 1, _spec_rifle ];
specs set [ 2, _spec_sniper ];
specs set [ 3, _spec_medic ]; 

/// main loop ////

while { true } do 
{
    try {
		if ( gunner ownship == player ) then {
		
		    //# get altitude #
		    _pos = getPosATL ownship;
			_alt = _pos select 2; 
			alt = _alt; 
			
			player globalChat str _alt; 
		
		}
	} catch {
		driver vehicle player globalChat "try catch error"; 
	};
	
	sleep 2; 
}; 
