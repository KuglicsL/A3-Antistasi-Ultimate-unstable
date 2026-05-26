/*
	Author:
	Zets

	Description:
	Get all compatibile magazines except forbidden ones for selected weapons. Function looks both for magazines listed in "magazines" array & compatibile magazineWells.
	
	Params:
		0: (String) :
			Weapon class name
		1: (Array) [Optional] :
			List of magazines to be excluded from result
		2: (Bool) [Optional] :
			Decide if magazines with scope 1 should be also returned

	Output:
		Array of magazines (strings)

	Usage:
		[_weapon] call A3U_fnc_compatibleMagazinesWithExceptions;
		[_weapon, _forbiddenList] call A3U_fnc_compatibleMagazinesWithExceptions;
*/

params [
	["_weapon","",[""]],
	["_forbiddenList",[],[[]]],
	["_showHidden",false,[false]]
];

private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;


if (isClass _weaponCfg) then{
	private _compatibleMagazines = [];
	private _magazinesList = [];

	private _factions = A3A_saveData get "factions";
	private _rebelFlags =  getArray (configFile/"A3A"/"Templates"/(_factions#2)/"equipFlags");
	private _cwModeMags = false;
	{
		if ("coldWar" in _x) then {
			_cwModeMags = true;
		}
	} forEach _rebelFlags;

	// Go through all available muzzles
	{
		_muzzle = if (_x == "this") then {_weaponCfg} else {_weaponCfg >> _x};

		// Get magazines from "magazines" array
		if (_cwModeMags) then {
			_magazinesList = (getarray (_muzzle >> "magazines")) arrayIntersect (lootMagazine);
			{
				_compatibleMagazines pushBackUnique _x;
			} forEach _magazinesList;
		} else {
			_magazinesList = getarray (_muzzle >> "magazines");
			// Add magazines from magazine wells
			{	
				{
					_magazinesList append (getArray _x);
				} foreach  configproperties [configFile >> "CfgMagazineWells" >> _x,"isArray _x"];
			} foreach getArray (_muzzle >> "magazineWell");

			// Add only unique entries to output
			{
				private _magazine		= _x;
				private _magazineCfg	= configfile >> "cfgMagazines" >> _magazine;

				if ( ((getnumber (_magazineCfg >> "scope") isEqualTo 2) || _showHidden) && !(_magazine in _forbiddenList)) then {
					_compatibleMagazines pushBackUnique _magazine;
				};
			} foreach _magazinesList;
		};
	} foreach getarray (_weaponCfg >> "muzzles");

	_compatibleMagazines

} else {
	if (_weapon != "") then {["'%1' not found in CfgWeapons",_weapon] call bis_fnc_error;};
	[]
};