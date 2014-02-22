#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;



Notify()
{
self notifyOnPlayerCommand("n", "+actionslot 1");
self notifyOnPlayerCommand("action4", "+actionslot 2");
self notifyOnPlayerCommand("k", "+actionslot 4");

self thread doCustomKillstreak();
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
			  			  			 	  			  			  			  			  
			  self iPrintlnBold("^2Yout Teleport-Location is here"+self.location);
			  self.TeleportText setText("Press ^4[{+actionslot 2}] to teleport"); 
			  wait .1;
			  self waittill("action4");
			  self.locationtwo = self getOrigin() ;
			  
			  playFx(level._effect["money"], self getTagOrigin( "j_spine4" ));
			  wait 0.0001;
			  self SetOrigin( self.location );
			  
			  
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
self endon ( "death" );

for(;; )
{
self waittill( "k" );
self beginLocationSelection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
self.selectingLocation = true;
self waittill( "confirm_location", newlocation, directionYaw );
location = PhysicsTrace( newLocation + ( 0, 0, 1000 ), newLocation - ( 0, 0, 1000 ) );

self endLocationSelection();
self.selectingLocation = undefined;

jet = spawnplane(self, "script_model", location + (10000,10000,1500) , "compass_objpoint_airstrike_friendly", "compass_objpoint_airstrike_busy");
jet setModel("vehicle_mig29_desert"); //for model, a jet example
jet.angles = (0,directionYaw,0);
//jet EnableLinkTo();
jet MoveTo(location + (0,0,1500 ), 5);
wait 5;
jet MoveTo(location - (10000,10000,-1500 ), 5);




missile = spawn( "script_model", location + (0,0,500 ));
missile setModel( "projectile_javelin_missile" );


missile MoveTo(location, 1);
wait 1;	
missile playSound("harrier_jet_crash");
missile delete();

playFx(level.chopper_fx["explode"]["medium"],location);
self playSound("harrier_jet_crash");


wait 0.001;
RadiusDamage( newLocation, 500, 500, 20, self );

wait 5;
jet delete();


}
}



