#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


Teleport()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("g", "+actionslot 4");
	self notifyOnPlayerCommand("h", "+frag");
    waffenText = self createFontString("default", 1.5);
    waffenText setPoint("TOPRIGHT", "TOPRIGHT", -5, 30);	
	waffenText setText(""); 
	while(true) {
        self waittill("g");
			  self playSound("claymore_activated");
			  self ThermalVisionFOFOverlayOn();
			  self.location=self getOrigin() ;
			  
			  vec = anglestoforward(self getPlayerAngles());
			  end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
			  origin = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self )[ "position" ];			  			  			  			  			  
			  self iPrintlnBold("^2Yout Teleport-Location is here");
			  wait 2;
			  self waittill("h");
			  self SetOrigin( origin );
			  self SetPlayerAngles( vec );
			  self iPrintlnBold("^1Teleport activated");
			  
			  wait 2;		  
			  for (self.counter=30;self.counter>0;self.counter--)
			  {
			  waffenText setText("^3 Next cheat use: "+self.counter);
			   wait 1;
			  
			   }
			  waffenText setText(""); 
			   self playSound("mp_level_up"); 
 
        }
}