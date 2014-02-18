#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;



Notify()
{
self notifyOnPlayerCommand("n", "+actionslot 1");
self notifyOnPlayerCommand("action4", "+actionslot 2");
self thread RedBox();
self thread Teleport();
}
RedBox()
{
    self endon("disconnect");
    self endon("death");
    
    waffenText = self createFontString("default", 1.5);
    waffenText setPoint("TOPRIGHT", "TOPRIGHT", -5, 20);	
	waffenText setText(""); 
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
			  waffenText setText("^3 Next Cheat use: "+self.counter);
			   wait 1;
			  
			   }
			  waffenText setText(""); 
			   self playSound("mp_level_up"); 
 
        }
}

Teleport()
{
    self endon("disconnect");
    self endon("death");
    
	
	
    TeleportText = self createFontString("default", 1.5);
    TeleportText setPoint("TOPRIGHT", "TOPRIGHT", -5, 30);	
	TeleportText setText("Komm ich bis hier ?"); 
	while(true) {
        self waittill("action4");
			  self playSound("claymore_activated");
			  
			  self.location=self getOrigin() ;
			  
			  vec = anglestoforward(self getPlayerAngles());
			  //end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
			  //origin = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self )[ "position" ];			  			  			  			  			  
			  self iPrintlnBold("^2Yout Teleport-Location is here"+self.location);
			  wait 2;
			  self waittill("action4");
			  self SetOrigin( self.location );
			  //self SetPlayerAngles( vec );
			  self iPrintlnBold("^1Teleport activated");
			  
			  wait 2;		  
			  for (self.counter=30;self.counter>0;self.counter--)
			  {
			  TeleportText setText("^3 Next Teleport use: "+self.counter);
			   wait 1;
			  
			   }
			  TeleportText setText(""); 
			   self playSound("mp_level_up"); 
 
        }
}