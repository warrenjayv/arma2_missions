
/* EVENTS
 * scenario / event generator. 
 *
 */
 
 sleep 2; 
 
 /* trigger locations */ 
 
 _mrks = [];
 mrkpos = []; 
 
 _mrks set [ 0, "berezino" ];
 _mrks set [ 1, "gorka" ];
 _mrks set [ 2, "gvozdno" ];
 _mrks set [ 3, "stary_sobor" ]; 

 _rand = random 3;
 _rand = round _rand;  
 _mrk = _mrks select _rand; 
 _mrk setMarkerSize [500, 500]; 
 
 mrkpos = getMarkerPos _mrk; 
 
 player globalChat "trigger: ";
 player globalChat str _rand; 
 player globalChat _mrk; 
 player globalChat str (_mrkpos select 0); 
 player globalChat str (_mrkpos select 1); 
 
 /* generate triggers */ 
 
 _trgA = createTrigger ["EmptyDetector", mrkpos ];
 _trgA setTriggerArea [500, 500, 0, false];
 _trgA setTriggerActivation ["EAST", "PRESENT", true];
 _trgA setTriggerStatements 
  [
    "this", 
	" execVM 'event_shooter.sqf'; execVM 'unload.sqf';", 
	""
   ];
   
  /* move player to trigger for testing */
  //player setPos mrkpos; 


/* locations :
 *
 *    berezino
 *    gorka 
 *    gvozdno
 *    stary sobor
 *
 */