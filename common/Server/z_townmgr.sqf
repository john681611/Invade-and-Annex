if (!isServer) exitWith {};
_towns=[];
_mapConfig = (configfile >> "CfgWorlds" >> worldName >> "Names");
 {
  _name = getText (_mapConfig >> (configName _x) >> "name");
  _text =  getText (_mapConfig >> (configName _x) >> "type");
  _pos = getArray (_mapConfig >> (configName _x) >> "position");

  if(!(_name in blacklistLocations)) then {
    if(!(_text in ['Hill','VegetationFir'])) then {_pos = nearestBuilding _pos;};
    _towns = _towns + [[_text,_pos, _name]];
  }else{
    diag_log "Location Blacklisted";
    diag_log _name;
  };

 } forEach ("getText (_x >> 'type') in ['Hill','VegetationFir','NameLocal','NameVillage','NameCity','NameCityCapital','Airport']" configClasses (_mapConfig));


ztownt = [];
ztowns = [];
ztownm = [];
ztownl = [];
ztownc = [];
ztownTA = [];
ztowna = [];
ztownAll = [];
//Extra areas
_towns = _towns;
{
    _pos = (_x select 1);


    _m = createMarker [format ["%1", _pos],_pos];
    if(!((getMarkerPos _m) in takenTowns)) then {
    	switch((_x select 0)) do
    	{
        case "VegetationFir";
    		case "Hill":
    		{
    			ztownt = ztownt + [_m];
    		};

    		case "NameLocal":
    		{
    			ztowns = ztowns + [_m];
    		};
    		case "NameVillage":
    		{
    			ztownm = ztownm + [_m];
    		};
    		case "NameCity":
    		{
    			ztownl = ztownl + [_m];
    		};

    		case "NameCityCapital":
    		{
    			ztownc = ztownc + [_m];
    		};
        case "Airport":{
          ztowna = ztowna + [_m];
        };
    		default {
          systemChat format["Warn unknown group $1", (_x select 0)];
    		};
    	};
      _m setMarkerColor "ColorYellow";
    } else {
      _m setMarkerColor "ColorGreen";
      ztownTA = ztownTA + [_m];
    };

    switch((_x select 0)) do
    {
      case "VegetationFir";
      case "Hill":
      {
        _m setMarkerSize [500,500];
      };

      case "NameLocal":
      {
        _m setMarkerSize [550,550];
      };
      case "NameVillage":
      {
        _m setMarkerSize [650,650];
      };
      case "NameCity":
      {
        _m setMarkerSize [700,700];
      };
      case "Airport":{
        _m setMarkerSize [750,750];
      };
      case "NameCityCapital":
      {
        _m setMarkerSize [800,800];
      };
      default {
      _m setMarkerSize [700,700];
      };
    };


    _m setMarkerShape "ELLIPSE";
    _m setMarkerBrush "Solid";
    _m setMarkerAlpha 0.0;
    _m setMarkerText (_x select 2);
} forEach _towns;


ztownAll = ztownTA + ztownc + ztownl + ztownm + ztowns + ztownt + ztowna;
ztowninit = 1;
