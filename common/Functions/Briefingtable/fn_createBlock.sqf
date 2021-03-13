params ["_step","_posX", "_posY", "_tableSize","_tableDir", "_dummy","_vectorDiff","_dirAndUp", "_table", "_scale","_useTerrainHeight","_markerDir", "_tableObjects","_cubeSize"];
private _tablePos = [_posX*_tableSize, _posY*_tableSize, 0];
private _worldPos = (_dummy modelToWorld (_tablePos vectorMultiply 1/_scale)); // divide by scale to scale back up
private _road = roadAt (_worldPos select [0,2]);
private _texture = if (!isNull _road) then {getRoadInfo _road select 3} else {surfaceTexture _worldPos};
private _normal = _dirAndUp select 1;
private _normals = [];
private _averageStep = _step/2;
// Sample normals over cube area:
for "_normalX" from -2*_averageStep to 2*_averageStep step _averageStep do {
	for "_normalY" from -2*_averageStep to 2*_averageStep step _averageStep do {
		private _checkPos = _worldPos vectorAdd [_normalX, _normalY];
		_normals pushBack (surfaceNormal _checkPos);
	};
};
{
	_normal = _normal vectorAdd _x;
} forEach _normals;
// You don't need to average the normals for the normal to look good.
// _normal = _normal vectorMultiply 1/count _normals;
// I have no idea why.
_normal = [_normal, _tableDir -_markerDir, 2] call BIS_fnc_rotateVector3D; // Not sure why I have to do this.
private _cos = abs (vectorUp _table vectorCos _normal);
private _dynamicSize = 1.1/_cos; // scale cubes based on angle
_cubeSize = _cubeSize * _dynamicSize; // 
_tablePos set [2, -(_worldPos#2 * _scale + _cubeSize/(2*_cos) + 0.5)]; // Z flip from worldpos. wtf?.
private _groundObject = createSimpleObject ["Land_VR_Shape_01_cube_1m_F", [0,0,0], true];
_groundObject enableSimulation false;
_groundObject setPosASL (_table modelToWorldWorld (_tablePos vectorAdd _vectorDiff));
_groundObject setVectorDirAndUp _dirAndUp;
_groundObject setVectorUp _normal;
for "_selection" from 0 to 4 do {
                _groundObject setObjectMaterial [_selection, "\a3\data_f\default.rvmat"];
                _groundObject setObjectTexture [_selection, _texture];
            };
_groundObject setObjectScale _cubeSize;
_tableObjects pushBack _groundObject;