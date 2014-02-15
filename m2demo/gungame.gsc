#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


initGuns()
{
    self.inverse = false; //Inverted gungame?
    self.upgscore = 50; //Score necessary for upgrade. Leave at 100 for 2 kill upgrade. Do 50 for 1 kill, 150 for 3 kill.
    self.finalkills = 1; //Kills to win after getting final weapon
    self.gunList = [];
    // Gun Code Name, Laser Sight, Akimbo
	self.gunList[0] = createGun("usp_mp", 9, false, true);
	self.gunList[1] = createGun("beretta_mp", 9, false, true);
	self.gunList[2] = createGun("coltanaconda_mp", 9, false, true);
	self.gunList[3] = createGun("deserteagle_mp", 9, false, true);
	self.gunList[4] = createGun("deserteaglegold_mp", 9, true, true);	
	self.gunList[5] = createGun("deserteagle_akimbo_fmj_mp", 9, true, true);
	self.gunList[6] = createGun("pp2000_mp", 9, true, true);
	self.gunList[7] = createGun("tmp_mp", 9, true, true);
	self.gunList[8] = createGun("beretta393_mp", 9, false, true);
	self.gunList[9] = createGun("glock_mp", 9, false, true);
	self.gunList[10] = createGun("ranger_mp", 9, false, true);
	self.gunList[11] = createGun("model1887_akimbo_mp", 9, false, true);
	self.gunList[12] = createGun("m1014_grip_reflex_mp", 9, false, false);
	self.gunList[13] = createGun("striker_grip_reflex_mp", 9, false, false);
	self.gunList[14] = createGun("spas12_grip_mp", 9, false, true);
	self.gunList[15] = createGun("aa12_mp", 9, false, false);
	self.gunList[16] = createGun("ranger_akimbo_mp", 9, false, true);
	self.gunList[17] = createGun("uzi_mp", 9, true, true);
	self.gunList[18] = createGun("kriss_mp", 9, true, true);
	self.gunList[19] = createGun("mp5k_mp", 9, true, true);
	self.gunList[20] = createGun("ump45_silencer_mp", 9, true, true);
	self.gunList[21] = createGun("p90_mp", 9, true, true);
	self.gunList[22] = createGun("famas_reflex_mp", 9, true, true);
	self.gunList[23] = createGun("fal_reflex_mp", 9, true, true);
	self.gunList[24] = createGun("scar_mp", 9, true, true);
	self.gunList[25] = createGun("m16_mp", 9, true, true);
	self.gunList[26] = createGun("m4_mp", 9, true, true);
	self.gunList[27] = createGun("ak47_mp", 9, true, true);
	self.gunList[28] = createGun("tavor_mp", 9, true, true);
	self.gunList[29] = createGun("fn2000_mp", 9, true, true);
	self.gunList[30] = createGun("masada_mp", 9, true, true);
	self.gunList[31] = createGun("sa80_mp", 9, true, true);
	self.gunList[32] = createGun("aug_grip_mp", 9, true, true);
	self.gunList[33] = createGun("rpd_grip_mp", 9, true, true);
	self.gunList[34] = createGun("mg4_grip_mp", 9, true, true);
	self.gunList[35] = createGun("m240_grip_mp", 9, true, true);
	self.gunList[36] = createGun("wa2000_fmj_mp", 9, false, false);
	self.gunList[37] = createGun("m21_fmj_mp", 9, false, false);
	self.gunList[38] = createGun("barrett_fmj_mp", 9, false, false);
	self.gunList[39] = createGun("cheytac_fmj_mp", 9, false, false);
	self.gunList[40] = createGun("m79_mp", 9, false, false);
	self.gunList[41] = createGun("at4_mp", 9, true, false);
	self.gunList[42] = createGun("rpg_mp", 9, false, true);
	self.gunList[43] = createGun("semtex_mp", 9, false, false);
	self.gunList[44] = createGun("c4_mp", 9, false, false);
	self.gunList[45] = createGun("concussion_grenade_mp", 9, false, false);
	self.gunList[46] = createGun("frag_grenade_mp", 9, false, false);
	self.gunList[47] = createGun("throwingknife_mp", 9, false, false);	
	
	
	self.gunNameList = [];
    // Gun Name
	self.gunNameList[0] = "Usp";
	self.gunNameList[1] = "M9";
	self.gunNameList[2] = "Magnum";
	self.gunNameList[3] = "Deserteagle";
	self.gunNameList[4] = "Deserteagle-Gold";	
	self.gunNameList[5] = "Deserteagle-Akimbo";
	self.gunNameList[6] = "PP2000";
	self.gunNameList[7] = "Tmp";
	self.gunNameList[8] = "M93 Raffica";
	self.gunNameList[9] = "G18";
	self.gunNameList[10] = "Ranger";
	self.gunNameList[11] = "Model1887-akimbo";
	self.gunNameList[12] = "M1014";
	self.gunNameList[13] = "Striker";
	self.gunNameList[14] = "Spas12";
	self.gunNameList[15] = "AA12";
	self.gunNameList[16] = "Ranger-akimbo";
	self.gunNameList[17] = "Mini-Uzi";
	self.gunNameList[18] = "Vector";
	self.gunNameList[19] = "MP5k";
	self.gunNameList[20] = "Ump45-Silenzer";
	self.gunNameList[21] = "P90";
	self.gunNameList[22] = "Famas";
	self.gunNameList[23] = "Fal";
	self.gunNameList[24] = "ScarH";
	self.gunNameList[25] = "M16a4";
	self.gunNameList[26] = "M4A1";
	self.gunNameList[27] = "Ak-47";
	self.gunNameList[28] = "Tar21";
	self.gunNameList[29] = "F2000";
	self.gunNameList[30] = "ARC";
	self.gunNameList[31] = "L86 LSW";
	self.gunNameList[32] = "AUG HBar";
	self.gunNameList[33] = "Rpd";
	self.gunNameList[34] = "Mg4";
	self.gunNameList[35] = "M240";
	self.gunNameList[36] = "Wa2000";
	self.gunNameList[37] = "M21 EBR";
	self.gunNameList[38] = "Barett.50cal";
	self.gunNameList[39] = "Intervention";
	self.gunNameList[40] = "Thumber";
	self.gunNameList[41] = "AT4-HS";
	self.gunNameList[42] = "RPG";
	self.gunNameList[43] = "Semtex";
	self.gunNameList[44] = "C4";
	self.gunNameList[45] = "Flash Grenade";
	self.gunNameList[46] = "Frag Grenade";
	self.gunNameList[47] = "Throwing-Knife";	
}

createGun(gunName, camo, laserSight, akimbo)
{
    gun = spawnstruct();
    gun.name = gunName;
    gun.camo = camo;
    gun.laser = laserSight;
    gun.akimbo = akimbo;
    return gun;
}

doBinds() //Put persistent threads that are started once here
{
    self.firstRun = true;
    self thread initGuns();
    self.nv = false;
    self thread doScore();
	self thread doWaffen();
	self thread doCredit();
    self thread doGun();
	
    setDvar("scr_dm_scorelimit", ((self.gunList.size - 1) * self.upgscore) + (self.finalkills * 50));
    setDvar("scr_dm_timelimit", 10000000);
    setDvar("ui_gametype", "ffa");
    setDvar("scr_game_hardpoints", 0);
}

doDvars() //Put threads that are called with every respawn
{
    setDvar("g_speed", 220);
    setDvar("bg_fallDamageMaxHeight", 1);
    setDvar("bg_fallDamageMinHeight", 99999);
    self setClientDvar("player_meleerange", 0);
    self _clearPerks();
    self maps\mp\perks\_perks::givePerk("specialty_bulletaccuracy");
    self maps\mp\perks\_perks::givePerk("specialty_bulletdamage");
    self maps\mp\perks\_perks::givePerk("specialty_bulletpenetration");
    self maps\mp\perks\_perks::givePerk("specialty_exposeenemy");
    self maps\mp\perks\_perks::givePerk("specialty_extendedmags");
    self maps\mp\perks\_perks::givePerk("specialty_fastreload");
    self maps\mp\perks\_perks::givePerk("specialty_fastsnipe");
    self maps\mp\perks\_perks::givePerk("specialty_marathon");
    self maps\mp\perks\_perks::givePerk("specialty_quieter");
    if(self.nv) self ThermalVisionFOFOverlayOn(); 
    else self VisionSetNakedForPlayer(getDvar("mapname"), 2);
    self redbox::RedBox();
	
    if(self.firstRun){
        if(self.inverse){
            self thread maps\mp\gametypes\_hud_message::hintMessage("^2Inverse Gun Game");
            self thread maps\mp\gametypes\_hud_message::hintMessage("^2Kill Enemies to Downgrade Your Gun");
        }else{
            self thread maps\mp\gametypes\_hud_message::hintMessage("^1Atomics ^2GunGame");
            self thread maps\mp\gametypes\_hud_message::hintMessage("^2Kill Enemies to Upgrade Your Gun");
        }
        self thread maps\mp\gametypes\_hud_message::hintMessage("^2Press ^4[{+actionslot 1}] ^2to Cheat :D");
        
        self.firstRun = false;

    }
}

doGun()
{
    self endon("disconnect");
    if(self.inverse) self.curgun = self.gunList.size - 1;
    else self.curgun = 0;
    curscore = 0;
    done = false;
    while(true){
        if(self.inverse && self.curgun <= 0) done = true;
        if(!self.inverse && self.curgun >= (self.gunList.size - 1)) done = true;
        if(!done){
            if(self.inverse && (self.score - curscore >= self.upgscore)){
                self.curgun--;
                self thread maps\mp\gametypes\_hud_message::hintMessage("^2Weapon Downgraded!");
                curscore = self.score;
            }else if((self.score - curscore >= self.upgscore)){
                self.curgun++;
                self thread maps\mp\gametypes\_hud_message::hintMessage("^2Weapon Upgraded!");
                curscore = self.score;
            }
        }
        while(self getCurrentWeapon() != self.gunList[self.curgun].name){
            if(self.gunList[self.curgun].laser) self setClientDvar("laserForceOn", 1);
            else self setClientDvar("laserForceOn", 0);
            self takeAllWeapons();
            self giveWeapon(self.gunList[self.curgun].name, self.gunList[self.curgun].camo, self.gunList[self.curgun].akimbo);
            self switchToWeapon(self.gunList[self.curgun].name);
            wait .2;
        }
        self giveMaxAmmo(self.gunList[self.curgun].name);
        wait .2;
    }
}

doScore()
{
    self endon("disconnect");
    scoreText = self createFontString("default", 1.5);
    scoreText setPoint("TOPRIGHT", "TOPRIGHT", -5, 0);
    while(true)
    {
        scoreText setText("^3 Level " + self.curgun);
        wait .2;
    }
}

doWaffen()
{
    self endon("disconnect");
    waffenText = self createFontString("default", 1.5);
    waffenText setPoint("TOPRIGHT", "TOPRIGHT", -5, 20);
    while(true)
    {
        waffenText setText("^3 Next Weapon: " + self.gunNameList[self.curgun + 1]);  //self.gunList[self.curgun + 1].name);
        wait .2;
    }
}

doCredit()
{
	self endon("disconnect");
	creditText = self createFontString("default", 1.5);
	creditText setPoint("TOP", "TOP", -5, 0);
	while(true)
	{
		creditText setText("GunGame test");
		wait .2;
	}
}