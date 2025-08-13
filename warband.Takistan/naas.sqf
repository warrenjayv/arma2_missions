systemchat "nato assault initiated.";

_ntgt = getMarkerPos "_nlz";

_txt  = formatText["bf attack: %1", _ntgt];
hint _txt; sleep 3; hintSilent "";

heli commandMove _ntgt;

_noff = noff; 
_npos = getMarkerPos "_nbase_a";

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

  _nheli doMove _ntgt;
  waitUntil { moveToCompleted _nheli }; 

  doGetOut [ _unit1, _unit2, _unit3 ]; 

  sleep 60; 

};
