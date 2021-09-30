
/* EVENTS
 * scenario / event generator. 
 *
 */
 
 sleep 2; 
 
 /* trigger locations */ 
 
 _mrks = [];
 _mrkpos = []; 
 
 _mrks set [ 0, "berezino" ];
 _mrks set [ 1, "gorka" ];
 _mrks set [ 2, "gvozdno" ];
 _mrks set [ 3, "stary_sobor" ]; 

 _rand = random 3;
 _rand = round _rand;  
 _mrk = _mrks select _rand; 
 _mrk setMarkerSize [500, 500]; 
 
 _mrkpos = getMarkerPos _mrk; 
 

 player globalChat "trigger: ";
 player globalChat str _rand; 
 player globalChat _mrk; 
 player globalChat str (_mrkpos select 0); 
 player globalChat str (_mrkpos select 1); 
 
 /* generate triggers */ 
 
 _trgA = createTrigger ["EmptyDetector", getMarkerPos _mrk ];
 _trgA setTriggerArea [5, 5, 0, false];
 _trgA setTriggerActivation ["ANYPLAYER", "PRESENT", true];
 _trgA setTriggerStatements ["this", "hint 'Civilian near player'", "hint 'no civilian near'"];

/* locations :
 *
 *    berezino
 *    gorka 
 *    gvozdno
 *    stary sobor
 *
 */