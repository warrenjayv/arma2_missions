systemchat "nato assault initiated.";

_nlz  = getMarkerPos "_nlz";
_ntgt = getMarkerPos "_ngt"; 

_txt  = formatText["bf attack: %1", _ntgt];
hint _txt; sleep 3; hintSilent "";

heli commandMove _ntgt;

_noff = noff; 
_npos = getMarkerPos "_nbase_a";

_canspawn = false; 

while { alive _noff } do 
{

  _nheli = createVehicle [ "UH60M_EP1", getMarkerPos "_nbase", [], 0, "IN FORMATION" ]; 

  _grp = createGroup west;
  _unit1 =  _grp createUnit [ "US_Soldier_AR_EP1", _npos, [], 0, "FORM" ]; 
  _unit1 moveInDriver _nheli; 

  _unit2 = _grp createUnit [ "US_Soldier_GL_EP1", _npos, [], 0, "FORM" ];
  _unit2 moveInGunner _nheli; 

  _unit3 = _grp createUnit [ "US_Soldier_TL_EP1", _npos, [], 0, "FORM" ];
  _unit3 moveInCargo _nheli; 


  _unit1 addEventHandler[ "GetOut", { _unit1 leaveVehicle _nheli; }];
  _unit2 addEventHandler[ "GetOut", { _unit2 leaveVehicle _nheli; }]; 
  _unit3 addEventHandler[ "GetOut", { _unit3 leaveVehicle _nheli; }]; 

  _units = units _grp; 

  _nheli doMove _nlz;
  waitUntil { moveToCompleted _nheli }; 

  doGetOut [ _unit1, _unit2, _unit3 ]; 
  _units allowGetIn false; 
  
  systemchat "units left"; 

  _units doMove _ntgt; 
  waitUntil { moveToCompleted _units }; 

  _canspawn = false; 

  sleep 60; 

};
