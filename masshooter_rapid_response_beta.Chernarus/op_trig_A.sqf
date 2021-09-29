	   
	   /*** TRIGGER: op_trig_A ***/
	   
	   /// initialize /// 
	   
	   // # NOTE: 
	   // # init of the spawn unit (men)
	   // # set `op_pos_A = getPos this;` #
	   
	   op_civs_cnt = 5; 
	   
	   // create group // 
	   
	   op_grp_A = createGroup resistance;
	   
	   /*** create shooter ***/ 
	   
	   op_grp_A setBehaviour "CARELESS";
	   op_unit_A_1 = op_grp_A createUnit [ "GUE_Soldier_1", op_pos_A, [],0,"PRIVATE"];                                                          
	   op_unit_A_1 doMove ( getMarkerPos "op_wp_A_1" );                       
	   //op_grp_A setBehaviour "CARELESS";
	   
	   /// check if waypoint 1 is reached ///
	   
	   /*
	   _trg = createTrigger [ "wp_reach", getMarkerPos "op_wp_A_1" ]; 
	   _trg setTriggerActivation [ "ANYPLAYER", "PRESENT", true ];
	   _trig setTriggerArea [ 2, 2, getDir this, true ];
	   _trig setTriggerStatements [ "this", "hint 'okay'", ""]; 
	   */
	   
	   /*** initialize civilians in the area ***/ 
	   
	   /// create random spawn ///
	    
		_newPosARRAY = []; 
		_markPosARRAY = []; 
		_civs_A = []; 
		_curMark = 0;  
	    
		/// generate marker spawns /// 
		for "_j" from 1 to op_civs_cnt do {
		
			_newPos = [ 0, 0 ]; 
			_newPosX =  (op_pos_A select 0) + (random(60)-30);  
			_newPosY =  (op_pos_A select 1) + (random(60)-30); 
			_newPos set [0, _newPosX];
			_newPos set [1, _newPosY]; 
			
			_newPosARRAY set [ _j - 1, _newPos ]; 
			
			_markN = createMarker [ format [ "markN%1", _j ], _newPos ];
		    _markN setMarkerType "waypoint";
			
			_markPosARRAY set [ _j - 1, _markN ]; 
		
		};//for(){}

       /// assert arrays ///
	   hint str count _markPosARRAY; 

       /// spawn civilians /// 
	    for "_i" from 1 to op_civs_cnt do { 
		
			//# get the current marker position #
			_curMark = (_markPosARRAY select _i); 
			_curPos = getMarkerPos _curMark; 
		
			_civ = civ_grp_A createUnit [ format["RU_Hooker%1", _i], _curPos, [], 0, "FORM"]; 	
			_civ allowDamage false; 
			_civs_A set [ _i, _civ ]; 

	
	    };//for(){}
		
		// # assert array # 
		//player globalChat str count _civs_A; 
		
		/// attack a random civilian /// 
	
	    // # obtain weapon # 
		//_op_unit_A_weps = primaryWeaponItems op_unit_A_1; 
	    //_wep_count = count _op_unit_A_weps; 
		
		//player globalChat str _wep_count; 
		
		/* for "_i" from 1 to _wep_count do { 
		    player globalChat (_op_unit_A_weps select _i); 
		}; //for(){} */
		
		_rand_i = round random count _civs_A; 
        player globalChat "_rand_i generated";
		player globalCHat str _rand_i; 
		
		// target & shoot // 
	    op_unit_A_1 commandFire (_civs_A select _rand_i); 
	   