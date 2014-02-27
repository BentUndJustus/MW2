#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;



Notify()
{
self notifyOnPlayerCommand("n", "+actionslot 1");
self notifyOnPlayerCommand("action4", "+actionslot 2");
self notifyOnPlayerCommand("k", "+actionslot 4");

//self thread doCustomKillstreak();

if (self.wallhackactivated == 1) {
self thread RedBox();
}

if (self.teleportactivated == 1) {
self thread Teleport();	 
}

}
DoText()
{
    self.waffenText = self createFontString("default", 1.5);
    self.waffenText setPoint("TOPRIGHT", "TOPRIGHT", -5, 15);	
	self.TeleportText = self createFontString("default", 1.5);
    self.TeleportText setPoint("TOPRIGHT", "TOPRIGHT", -5, 30);	
    



}
RedBox()
{
    self endon("disconnect");
    self endon("death");
    
  
	self.waffenText setText("Press ^4[{+actionslot 1}]^7 to Wallhack"); 
	while(true) {
        self waittill("n");
			  self playSound("claymore_activated");
              self.cheatcount--;
			  self ThermalVisionFOFOverlayOn();
			  self iPrintlnBold("^2Cheat activated");
			  wait 2;
			  self ThermalVisionFOFOverlayOff();
			  self iPrintlnBold("^1Cheat deactivated");
			  		  
			  for (self.counter=15;self.counter>0;self.counter--)
			  {
			  self.waffenText setText("^3 Next Cheat use: "+self.counter);
			   wait 1;
			  
			   }
			  self.waffenText setText(""); 
			  // self playSound("mp_level_up"); 
 
        }
}

Teleport()
{
    self endon("disconnect");
    self endon("death");
    
	
	
  
	self.TeleportText setText("Press ^4[{+actionslot 2}]^7 set Teleport-Location"); 
	while(true) {
        self waittill("action4");
			  self playSound("claymore_activated");
			  
			  self.location=self getOrigin() ;
			  			  			 	  			  			  			  			  
			  self iPrintlnBold("^2Your Teleport-Location is here"+self.location);
			  self.TeleportText setText("Press ^4[{+actionslot 2}] to teleport"); 
			  wait .1;
			  self waittill("action4");
			  self.locationtwo = self getOrigin() ;
			  
			  playFx(level._effect["money"], self getTagOrigin( "j_spine4" ));
			  wait 0.0001;
			  self SetOrigin( self.location );
			  wait 0.0001;
			  playFx(level._effect["money"], self getTagOrigin( "j_spine4" ));
			  wait 0.0001;
			  self iPrintlnBold("^1Teleport activated");
			  
			  wait 2;		  
			  for (self.countert=30;self.countert>0;self.countert--)
			  {
			  self.TeleportText setText("^3 Next Teleport use: "+self.countert);
			   wait 1;
			  
			   }
			  self.TeleportText setText(""); 
			   //self playSound("mp_level_up"); 
 
        }
}
doCustomKillstreak()
{
self endon ( "disconnect" );


self.location = [];
level.jet = [] ;
//self.missile = [];


self waittill( "k" );
for(self.counta=1;self.counta<4;self.counta++)
{

self beginLocationselection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
self.selectingLocation = true;
self waittill( "confirm_location", newLoca, directionYaw );
self.location[self.counta] = PhysicsTrace( newLoca + ( 0, 0, 1000 ), newLoca - ( 0, 0, 1000 ) );


self endlocationSelection();
self.selectingLocation = undefined;
wait 0.1;
self playSound("claymore_activated");
}
self thread dospawnJet(self);
level thread doDelete();
}
dospawnJet(selffish)
{
for(level.counto=1;level.counto<4;level.counto++)
{

level.jet[level.counto] = spawnplane(selffish, "script_model", selffish.location[level.counto] + (10000,10000,1500) , "compass_objpoint_airstrike_friendly", "compass_objpoint_airstrike_busy");
level.jet[level.counto] setModel("vehicle_mig29_desert"); 

level.jet[level.counto].angles = (0,225.882,0);
level.jet[level.counto] EnableLinkTo();

playFxOnTag( level.harrier_smoke, selffish, "tag_engine_left" );
playFxOnTag( level.harrier_smoke, selffish, "tag_engine_right" );
playFxOnTag( level.harrier_smoke, selffish, "tag_engine_left" );
playFxOnTag( level.harrier_smoke, selffish, "tag_engine_right" );
level.fx_airstrike_contrail = loadfx ("smoke/jet_contrail");
playfxontag( level.fx_airstrike_contrail, selffish, "tag_right_wingtip" );
playfxontag( level.fx_airstrike_contrail, selffish, "tag_left_wingtip" );
level.jet[level.counto] playLoopSound( "veh_b2_dist_loop" );
wait 0.001;

level.jet[level.counto] MoveTo(selffish.location[level.counto] + (0,0,1500), 2.5);
wait 2.5;
MagicBullet( "javelin_mp",selffish.location[level.counto] + (0,0,1500 ) ,selffish.location[level.counto] , selffish );
level.jet[level.counto] MoveTo(selffish.location[level.counto] - (10000,10000,-1500), 2.5);





selffish playSound("harrier_level.jet_crash");


wait 0.001;

}




}

startfunc()
{
self thread doCustomKillstreak(); 
}

dolocationMarker()
{
for(self.counta=1;self.counta<4;self.counta++)
{

self beginLocationselection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
self.selectingLocation = true;
self waittill( "confirm_location", newLoca, directionYaw );
self.location[self.counta] = PhysicsTrace( newLoca + ( 0, 0, 1000 ), newLoca - ( 0, 0, 1000 ) );


self endlocationSelection();
self.selectingLocation = undefined;
wait 0.1;
self playSound("claymore_activated");
}

}


doDelete()
{
wait 5.4;
for(level.counte=1;level.counte<4;level.counte++)
{

level.jet[level.counte] delete();

}


}

