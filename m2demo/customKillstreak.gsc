#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


doTeleport()
{
self endon ( "disconnect" );
self endon ( "death" );
self notifyOnPlayerCommand("dpad_up", "+actionslot 1");
for(;; )
{
self waittill( "dpad_up" );
self beginLocationSelection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
self.selectingLocation = true;
self waittill( "confirm_location", location, directionYaw );
newLocation = BulletTrace( location, ( location + ( 0, 0, -100000 ) ), 0, self )[ "position" ];
//self SetOrigin( newLocation );
//self SetPlayerAngles( directionYaw );
earthquake( newLocation, 3500 );
earthquake( 0,0,0, 3500 );


self endLocationSelection();
self.selectingLocation = undefined;
}
}