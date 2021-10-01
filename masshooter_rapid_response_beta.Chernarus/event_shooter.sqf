
/*** EVENT SHOOTER ***/
/* requires events.sqf 
 * 
 */
 
 player globalChat "loaded shooter event"; 

/// initialize /// 

 // groups //
  
  _shootr_grp = createGroup resistance; 
  _civ_grp = createGroup civilian; 
  
  // shooter // 
  
  _shootr = _shootr_grp createUnit [ "GUE_Soldier_1", mrkpos, [], 0, "PRIVATE" ]; 
  
  // civilians // 
  
  // random spawns //
  
    _newPosARRAY = []; 
    _markPosARRAY = []; 
    _civs_A = []; 
	_curMark = 0;  
  
   for "_j" from 0 to 4 do {
		
		_newPos = [ 0, 0 ]; 
		_newPosX =  (op_pos_A select 0) + (random(60)-30);  
		_newPosY =  (op_pos_A select 1) + (random(60)-30); 
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
		
		_civ = _civ_grp createUnit [ format["RU_Hooker%1", (_i+1)], _curPos, [], 0, "FORM"]; 	
		_civ allowDamage false; 
		_civs_A set [ _i, _civ ]; 

	};//for(){}
	