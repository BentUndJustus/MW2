#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


Startap(){
//Settings
self.activategungame = 1;
self.cheats= 1 ;
self.wallhackactivated=1;
self.teleportactivated=1;
self.activateCustomKillstreaks=1;
self.menuopen=0;
self.fps=1;
level.enderact=1;
self.menuoptions = strTok( "GunGameMod by Ju57u5 and Bent|FPS|Press [{+activate}] to Switch|Press [{+melee}] to Select", "|" );
self.dvarvar = [];
self setClientDvar( "sv_cheats", 1);
//Settings



if (self.activategungame == 1) {
 self thread gungame::doDvars();
 }
if (self.cheats == 1) {
 self Buttons::Notify();
 }
if (self.activateCustomKillstreaks == 1) { 
self thread customKillstreak::doCustomKillstreaks(); 
}

}
Startuptwo()
{



if (self.gungame == 1){
 self thread gungame::doBinds();
}

self Buttons::DoText();

}