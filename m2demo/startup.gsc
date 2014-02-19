#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


Startap(){
//Settings
self.activategungame = 1;
self.cheats= 1 ;




//Settings



if (self.activategungame == 1) {
 self gungame::doDvars();
 }
if (self.cheats == 1) {
 self Buttons::Notify();
 }




}
Startuptwo()
{



if (self.gungame == 1){
 self gungame::doBinds();
}

self Buttons::DoText();

}