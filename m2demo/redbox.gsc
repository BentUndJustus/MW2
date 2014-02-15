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
			  wait 15;
			  self iPrintlnBold("^2You can cheat right now");
 
        }
}