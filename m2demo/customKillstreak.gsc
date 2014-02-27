#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;



doCustomKillstreaks() 
{
self endon ("death");

self.startscore = self.pers["kills"];
self.sperre = [];

for( self.ccc = 0 ; self.ccc<26 ;self.ccc++)
{

self.sperre[self.ccc] = 0;

}

while(1) {
if(self.killcount != self.pers["kills"] - self.startscore) {
self.killcount = self.pers["kills"] - self.startscore;
switch(self.killcount)
{
case 0: 
if (self.sperre[self.killcount] == 0)
{
self notify("newstreak");
self Buttons::startfunc(); 
self.sperre[self.killcount]=1;
}
break;

case 3: 
if (self.sperre[self.killcount] == 0)
{
self notify("newstreak");
self iPrintlnBold("^2You got our custom Killstreak! Press ^4[{+actionslot 4}]^2 to use it.");
self Buttons::startfunc(); 
}
self.sperre[self.killcount]=1;	
break;

case 6: 
self notify("newstreak");

break;

}
}
wait 0.05;





}
}