#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


doCustomKillstreak()
{
self endon ( "disconnect" );
self endon ( "death" );

for(;; )
{
self waittill( "dpad_up" );
self beginLocationSelection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
self.selectingLocation = true;
self waittill( "confirm_location", location, directionYaw );
newLocation = BulletTrace( location, ( location + ( 0, 0, -100000 ) ), 0, self )[ "position" ];

playFx( level._effect["ac130_explode"],newLocation);
RadiusDamage( SPLOSIONlocation, 500, 1000, 500, self );


self endLocationSelection();
self.selectingLocation = undefined;
}
}