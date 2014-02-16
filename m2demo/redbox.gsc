#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


RedBox()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("n", "+actionslot 1");
    while(true) {
        self waittill("n");
			  self playSound("claymore_activated");
              self.cheatcount--;
			  self ThermalVisionFOFOverlayOn();
			  self iPrintlnBold("^2Cheat activated");
			  wait 2;
			  self ThermalVisionFOFOverlayOff();
			  self iPrintlnBold("^1Cheat deactivated");
			  waffenText = self createFontString("default", 1.5);
              waffenText setPoint("TOPRIGHT", "TOPRIGHT", -5, 30);			  
			  for (self.counter=15;self.counter>0;self.counter--)
			  {
			  waffenText setText("^3 Next cheat use: "+self.counter);
			   wait 1;
			  
			   }
			  waffenText setText(""); 
			   self playSound("mp_level_up"); 
 
        }
}