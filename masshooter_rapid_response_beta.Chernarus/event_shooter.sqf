
/*** EVENT SHOOTER ***/
/* requires events.sqf 
 * 
 */
 
 player globalChat "loaded shooter event"; 

/// initialize /// 

 // groups //
  
  _shootr_grp = createGroup resistance; 
  _civ_grp = createGroup civilian; 
  _civ_east = createGroup east; 
  
  // shooter // 
  
  _shootr = _shootr_grp createUnit [ "GUE_Soldier_1", mrkpos, [], 0.5, "PRIVATE" ]; 
  shootr_gbl = _shootr;
  
  // civilians are enemy //
  
  resistance setFriend [ civilian, 0 ]; 
  //resistance setFriend [ east, 1 ]; 
  civilian setFriend [ resistance, 0 ]; 
  
  // civilians // 
  
  // random spawns //
  
    _newPosARRAY = []; 
    _markPosARRAY = []; 
    _civs_A = []; 
	_curMark = 0;  
	_newPos = []; 
    _static = []; 
    
   for "_j" from 0 to 4 do {
		
		_newPosX =  (mrkpos select 0) + (random(60)-30);  
		_newPosY =  (mrkpos select 1) + (random(60)-30); 
		_newPos set [0, _newPosX];
		_newPos set [1, _newPosY]; 
		
		_newPosARRAY set [ _j, _newPos ]; 
			
		_markN = createMarker [ format [ "markN%1", _j ], _newPos ];
		_markN setMarkerType "waypoint";
			
		_markPosARRAY set [ _j, _markN ]; 
		
	};//for(){}
	
	// spawn //
	for "_i" from 0 to 4 do { 
		
		// get the current marker position //
		
		_curMark = (_markPosARRAY select _i); 
		_curPos = getMarkerPos _curMark; 
		
		// create civilian // 
		
		_civ = _civ_grp createUnit [ format["RU_Hooker%1", (_i+1)], _curPos, [], 0, "FORM"]; 	
		_civ allowDamage false; 
		_civs_A set [ _i, _civ ]; 
	
		
	};//for(){}
	
	// hostile to shooter // 
	
	_civs_A joinSilent _civ_east;
	
	// shoot civlians // 

	_muzzle = primaryWeapon _shootr; 
	
	while { alive _shootr } do { 

	    _rando = round (random 4);
		_civ_tgt = _civs_A select _rando; 
		_static = getPos _civ_tgt; 
		_shootr doMove (_static); 
		
        _shootr doTarget _civ_tgt; 
        _shtr_pos = getPos _shootr; 
		
		
		_difx = (_shtr_pos select 0) - (_static select 0);
		_dify = (_shtr_pos select 1) - (_static select 1); 
		
		//player globalChat str _difx;
		//player globalChat str _dify; 
		
		if (! isNull _civ_tgt ) then {
			if ( (_difx < 10) || (_dify < 10) ) then {
				for "_i" from 0 to 500 do {
			
					//_shootr fireAtTarget [_civ_tgt, _muzzle];
					_shootr fire _muzzle;
				
				}; 

				_difx = 1000; 
				_dify = 1000;
			};
			
		}; //if(){}
		
		player globalChat str _rando; 
		
		sleep 10; 
		
	}; 
	
	//player globalChat _muzzle; 
	//player globalChat str _civ_tgt; 
	