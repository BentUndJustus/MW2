#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;



Notify()
{
self notifyOnPlayerCommand("n", "+actionslot 1");
self notifyOnPlayerCommand("action4", "+actionslot 2");
self thread RedBox();
self thread Teleport();	 

//self thread DoText();
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
    
  //  self.waffenText = self createFontString("default", 1.5);
  //  self.waffenText setPoint("TOPRIGHT", "TOPRIGHT", -5, 15);	
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
			   self playSound("mp_level_up"); 
 
        }
}

Teleport()
{
    self endon("disconnect");
    self endon("death");
    
	
	
  //  self.TeleportText = self createFontString("default", 1.5);
  //  self.TeleportText setPoint("TOPRIGHT", "TOPRIGHT", -5, 30);	
	self.TeleportText setText("Press ^4[{+actionslot 2}]^7 set Teleport-Location"); 
	while(true) {
        self waittill("action4");
			  self playSound("claymore_activated");
			  
			  self.location=self getOrigin() ;
			  
			  vec = anglestoforward(self getPlayerAngles());
			  //end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
			  //origin = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self )[ "position" ];			  			  			  			  			  
			  self iPrintlnBold("^2Yout Teleport-Location is here"+self.location);
			  self.TeleportText setText("Press ^4[{+actionslot 2}] to teleport"); 
			  wait .1;
			  self waittill("action4");
			  self SetOrigin( self.location );
			  //self SetPlayerAngles( vec );
			  self iPrintlnBold("^1Teleport activated");
			  
			  wait 2;		  
			  for (self.countert=30;self.countert>0;self.countert--)
			  {
			  self.TeleportText setText("^3 Next Teleport use: "+self.countert);
			   wait 1;
			  
			   }
			  self.TeleportText setText(""); 
			   self playSound("mp_level_up"); 
 
        }
}