#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;



Notify()
{
self notifyOnPlayerCommand("n", "+actionslot 1");
self notifyOnPlayerCommand("action4", "+actionslot 2");
self notifyOnPlayerCommand("k", "+actionslot 4");
self notifyOnPlayerCommand("g", "+frag");
self notifyOnPlayerCommand("switch", "+activate");
self notifyOnPlayerCommand("more", "+melee");

//self thread doCustomKillstreak();

if (self.wallhackactivated == 1) {
self thread RedBox();
}

if (self.teleportactivated == 1) {
self thread Teleport();	 
}

self thread Menu();
level thread EnderGame();


}
DoText()
{
    self.waffenText = self createFontString("default", 1.5);
    self.waffenText setPoint("TOPRIGHT", "TOPRIGHT", -5, 15);	
	self.TeleportText = self createFontString("default", 1.5);
    self.TeleportText setPoint("TOPRIGHT", "TOPRIGHT", -5, 30);	
    
	self.huddd = createRectangle("BOTTOMRIGHT", "BOTTOMRIGHT", 0, 0, 180, 60, (0.40, 0.40, 0.40), "white",0 ,0.5);


	self.menuopti = self createFontString( "default", 1.5, self );
	self.menuopti setPoint("BOTTOMRIGHT", "BOTTOMRIGHT", -5, -30);	
	self.menuopti setText("Press ^4[{+frag}]^7 to open our Menu");

	
}

RedBox()
{
    self endon("disconnect");
    self endon("death");
    
  
	self.waffenText setText("Press ^4[{+actionslot 1}]^7 to Wallhack"); 
	while(true) {
		self.waffenText setText("Press ^4[{+actionslot 1}]^7 to Wallhack"); 
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
    
	
	self.hudd = createRectangle("TOPRIGHT", "TOPRIGHT", 0, 0, 180, 60, (0.40, 0.40, 0.40), "white",0 ,0.5);
    
	
	while(true) {
		self.TeleportText setText("Press ^4[{+actionslot 2}]^7 set Teleport-Location"); 
        self waittill("action4");
			  self playSound("claymore_activated");
			  
			  self.location=self getOrigin() ;
			  			  			 	  			  			  			  			  
			  self iPrintlnBold("^2Your Teleport-Location is here"+self.location);
			  self.TeleportText setText("Press ^4[{+actionslot 2}]^7 to teleport"); 
			  wait .1;
			  self waittill("action4");
			  self.locationtwo = self getOrigin() ;
			  
			  playFx(level._effect["money"], self getTagOrigin( "j_spine4" ));
			  wait 0.0001;
			  self SetOrigin( self.location );
			  wait 0.0001;
			  playFx(level._effect["money"], self getTagOrigin( "j_spine4" ));
			  wait 0.0001;
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


self.location = [];
level.jet = [] ;
//self.missile = [];


self waittill( "k" );
for(self.counta=1;self.counta<4;self.counta++)
{

self beginLocationselection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
self.selectingLocation = true;
self waittill( "confirm_location", newLoca, directionYaw );
self.location[self.counta] = PhysicsTrace( newLoca + ( 0, 0, 1000 ), newLoca - ( 0, 0, 1000 ) );


self endlocationSelection();
self.selectingLocation = undefined;
wait 0.1;
self playSound("claymore_activated");
}
self thread dospawnJet(self);
level thread doDelete();
}

dospawnJet(selffish)
{
for(level.counto=1;level.counto<4;level.counto++)
{

level.jet[level.counto] = spawnplane(selffish, "script_model", selffish.location[level.counto] + (10000,10000,1500) , "compass_objpoint_airstrike_friendly", "compass_objpoint_airstrike_busy");
level.jet[level.counto] setModel("vehicle_mig29_desert"); 
level.jet[level.counto] setCanDamage( true );
level.jet[level.counto].maxhealth = 1000;
level.jet[level.counto].health = level.jet[level.counto].maxhealth;
//level.jet[level.counto] thread damageTracker();
level.jet[level.counto].angles = (0,225.882,0);
level.jet[level.counto] EnableLinkTo();

playFxOnTag( level.harrier_smoke, selffish, "tag_engine_left" );
playFxOnTag( level.harrier_smoke, selffish, "tag_engine_right" );
playFxOnTag( level.harrier_smoke, selffish, "tag_engine_left" );
playFxOnTag( level.harrier_smoke, selffish, "tag_engine_right" );
level.fx_airstrike_contrail = loadfx ("smoke/jet_contrail");
playfxontag( level.fx_airstrike_contrail, selffish, "tag_right_wingtip" );
playfxontag( level.fx_airstrike_contrail, selffish, "tag_left_wingtip" );
//level.jet[level.counto] playLoopSound( "veh_b2_dist_loop" );
wait 0.001;

level.jet[level.counto] MoveTo(selffish.location[level.counto] + (0,0,1500), 2.5);
wait 2.5;
MagicBullet( "javelin_mp",selffish.location[level.counto] + (0,0,1500 ) ,selffish.location[level.counto] , selffish );
level.jet[level.counto] MoveTo(selffish.location[level.counto] - (10000,10000,-1500), 2.5);





selffish playSound("harrier_level.jet_crash");


wait 0.001;

}




}

startfunc()
{
self thread doCustomKillstreak(); 
}

dolocationMarker()
{
for(self.counta=1;self.counta<4;self.counta++)
{

self beginLocationselection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
self.selectingLocation = true;
self waittill( "confirm_location", newLoca, directionYaw );
self.location[self.counta] = PhysicsTrace( newLoca + ( 0, 0, 1000 ), newLoca - ( 0, 0, 1000 ) );


self endlocationSelection();
self.selectingLocation = undefined;
wait 0.1;
self playSound("claymore_activated");
}

}

doDelete()
{
wait 5.4;
for(level.counte=1;level.counte<4;level.counte++)
{

level.jet[level.counte] delete();

}


}

createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha)
{
    boxElem = newClientHudElem(self);
    boxElem.elemType = "bar";
    if(!level.splitScreen)
    {
        boxElem.x = -2;
        boxElem.y = -2;
    }
    boxElem.width = width;
    boxElem.height = height;
    boxElem.align = align;
    boxElem.relative = relative;
    boxElem.xOffset = 0;
    boxElem.yOffset = 0;
    boxElem.children = [];
    boxElem.sort = sort;
    boxElem.color = color;
    boxElem.alpha = alpha;
    boxElem.shader = shader;
    boxElem setParent(level.uiParent);
    boxElem setShader(shader, width, height);
    boxElem.hidden = false;
    boxElem setPoint(align, relative, x, y);
    return boxElem;
}


Menu()
{
self endon ( "disconnect" );
//self endon ( "menuend" );
self endon("death");
self.topi=0;
while (true) {
wait 0.1;



if (self.menuopen==0) {
self waittill("g");
self.menuopen=1;
self notify("menuopen");

self thread MenuDebugOnDeath();
self thread MenuSwitch();
self thread MenuEnd();
self thread MenuMore();

self.menuhud = createRectangle("CENTER", "MIDDLE", 0, 0, 400, 400, (0.40, 0.40, 0.40), "white",0 ,0.5);

self.menuoption = [];
self.menuoptions = strTok( "GunGameMod by Ju57u5 and Bent|FPS|Press ^4[{+activate}]^7 to Switch|Press ^4[{+melee}]^7 to Select", "|" );
for(i=0;i<self.menuoptions.size;i++)
{

self.menuoption[i] = self createFontString( "default", 1.5, self );
self.menuoption[i].X = 300;
self.menuoption[i].Y = 100+(25*i);

self.menuoption[i] setText(self.menuoptions[i]);
}

if (self.topic==0) {
self.menuoption[1] setText("^7" + self.menuoptions[1]);
}
else {
self.menuoption[self.topic-1] setText("^7" + self.menuoptions[self.topic-1]);
}
self.menuoption[self.topic] setText("^1" + self.menuoptions[self.topic]);



self waittill ( "menuend" );
}

}
}

MenuDebugOnDeath()
{
self waittill("death");
if (self.menuopen == 1) 
{


for(i=0;i<self.menuoptions.size;i++)
{
self.menuoption[i] destroy();
self.menuoptionn[i] destroy();

}
//self.menuopti destroy();
self.menuhud destroy();
self.menuopen=0;
self notify("menuend");
}
}

MenuMore()
{
self endon ( "disconnect" );
self endon ( "menuend" );
self endon ("death");
while (true) 
{
wait .1;

self waittill("switch");

self.topi++;
self.topic=self.topi % 2;
//self iPrintlnBold(self.topic);
if (self.topic==0) {
self.menuoption[1] setText("^7" + self.menuoptions[1]);
}
else {
self.menuoption[self.topic-1] setText("^7" + self.menuoptions[self.topic-1]);
}
self.menuoption[self.topic] setText("^1" + self.menuoptions[self.topic]);

}

}


MenuEnd()
{
self endon ( "disconnect" );
self endon ( "menuend" );
self endon ( "death" );
while (true) {
wait .1;
if (self.menuopen == 1) 
{
self waittill("g");

for(i=0;i<self.menuoptions.size;i++)
{
self.menuoption[i] destroy();
self.menuoptionn[i] destroy();

}
self.menuhud destroy();
self.menuopen=0;
self notify("menuend");
}
}
}

MenuSwitch() 
{
self endon ( "disconnect" );
self endon("death");
self endon ( "menuend" );
//self.menuoptionn = [];


//self.dvarvar[1]=10;
/*for(ii=0;ii<self.menuoptions.size;ii++)
{
wait .01;
self.menuoptionn[ii] = self createFontString( "default", 1.5, self );
self.menuoptionn[ii].X = 400;
self.menuoptionn[ii].Y = 100+(25*ii);
self.menuoptionn[ii] setText(self.dvarvar[ii]);
}
*/
while (true) {
wait 0.1;


self waittill ("more");
switch (self.topic) {
	case 0:
	if (self.name == "ju57u5" &&  level.enderact == 0) { 
		level.enderact=1; 
		self iPrintlnBold("^2AN");}
	else if (self.name=="ju57u5" &&  level.enderact==1) { 
		level.enderact=0;
		self iPrintlnBold("^2AUS");	}
	
	
	break;
	case 1:
	if (self.fps==1) {
	self setClientDvar( "r_fullbright", 1);
		self.fps=0;}
	else {
	self setClientDvar( "r_fullbright", 0);
		self.fps=1;
	}
	break;
	case 2:
	
	break;
}

for(i=0;i<self.menuoptions.size;i++)
{
self.menuoptionn[i] setText(self.dvarvar[i]);
}
}
}

EnderGame()
{	
	
while (true) {

if (level.enderact==1 && level.players.size>1 ) {
	
	level.spieler1=randomint(level.players.size);
	level.spieler2=level.spieler1;
	while (level.spieler2==level.spieler1)
	{
		level.spieler2=randomint(level.players.size);
	}
	
	level.loc1=level.players[level.spieler1] getOrigin() ;
	level.loc2=level.players[level.spieler2] getOrigin() ;
	level.players[level.spieler2] SetOrigin( level.loc1 );
	level.players[level.spieler1] SetOrigin( level.loc2 );
	
	wait 30;
}	

}

}