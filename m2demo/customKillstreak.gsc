#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


doCustomKillstreaks() 
{
self endon ("death");

self.startscore = self.pers["kills"];

while(1) {
if(self.killcount != self.pers["kills"] - self.startscore) {
self.killcount = self.pers["kills"] - self.startscore;
switch(self.killcount)
{
case 1: //This is the Killstreak Number the player need
self notify("newstreak");
//Here you add the action/thread for what gone happen
break;
case 2: 
self notify("newstreak");

break;
case 3: 
self notify("newstreak");
self Buttons::doCustomKillstreak(); 
break;
case 4: 
self notify("newstreak");

break;
case 5: 
self notify("newstreak");

break;
case 6: 
self notify("newstreak");

break;
case 7: 
self notify("newstreak");

break;
case 8: 
self notify("newstreak");

break;
case 9: 
self notify("newstreak");

break;
case 10: 
self notify("newstreak");

break;
case 11: 
self notify("newstreak");

break;
}
}
wait 0.05;





}
}