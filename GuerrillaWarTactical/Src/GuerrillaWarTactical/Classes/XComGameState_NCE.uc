// This is an Unreal Script
//------------------------
//
class XComGameState_NCE extends Object Config(NCE);


//--------------- NCE Vars-----------------------------------

var Object SelfObject;
var int ValuesFromINI[16];
//----------- Config Vars------------------------------------
var config bool bIsRollCrit;
var config bool bIsRandSparks;

var config int Offense_high;
var config int Offense_low;
var config int Offense_Int;

var config int Mobility_high;
var config int Mobility_low;
var config int Mobility_Int;

var config int Will_high;
var config int Will_low;
var config int Will_Int;

var config int Hacking_high;
var config int Hacking_low;
var config int Hacking_Int;

var config bool bIsRandHP;
var config int HP_high;
var config int HP_low;
var config int HP_Int;

var config bool bIsRandDodge;
var config int Dodge_high;
var config int Dodge_low;
var config int Dodge_Int;

var config bool bIsRandDef;
var config int Defense_high;
var config int Defense_low;
var config int Defense_Int;

var config bool bIsRandCrit;
var config int CritChance_high;
var config int CritChance_low;
var config int CritChance_Int;

//------------Function--------
function RandomStats(XComGameState_Unit Soldier)
{
		local int Interval[8];
		local int vfiLength; //Number of Values from InI
		local array<int> RandomStats;
		local int i;
		local int currentStat;
		
		Interval[0]=Offense_Int;
		Interval[1]=Mobility_Int;
		Interval[2]=Will_Int;
		Interval[3]=Hacking_Int;
		Interval[4]=HP_Int;
		Interval[5]=Dodge_Int;
		Interval[6]=Defense_Int;
		Interval[7]=CritChance_Int;

		ValuesFromINI[0]=Offense_high;
		ValuesFromINI[1]=Offense_low;
		ValuesFromINI[2]=Mobility_high;
		ValuesFromINI[3]=Mobility_low;
		ValuesFromINI[4]=Will_high;
		ValuesFromINI[5]=Will_low;
		ValuesFromINI[6]=Hacking_high;
		ValuesFromINI[7]=Hacking_low;
		ValuesFromINI[8]=HP_high;
		ValuesFromINI[9]=HP_low;
		ValuesFromINI[10]=Dodge_high;
		ValuesFromINI[11]=Dodge_low;
		ValuesFromINI[12]=Defense_high;
		ValuesFromINI[13]=Defense_low;
		ValuesFromINI[14]=CritChance_high;
		ValuesFromINI[15]=CritChance_low;

		vfiLength=16;
//Randomizing Stats
		for(i=0;i<vfiLength;i=i+2)
		{		
			currentStat= EWRollStat( ValuesFromINI[i+1], ValuesFromINI[i], Interval[i/2] );
			RandomStats.addItem(currentStat);			
		}
//Applying the RandomStats

			Soldier.setBaseMaxStat(eStat_Offense,RandomStats[0]);
			Soldier.setCurrentStat(eStat_Offense,RandomStats[0]);
				
			Soldier.setBaseMaxStat(eStat_Mobility,RandomStats[1]);
			Soldier.setCurrentStat(eStat_Mobility,RandomStats[1]);
					
			Soldier.setBaseMaxStat(eStat_Will,RandomStats[2]);
			Soldier.setCurrentStat(eStat_Will,RandomStats[2]);
				
			Soldier.setBaseMaxStat(eStat_Hacking,RandomStats[3]);
			Soldier.setCurrentStat(eStat_Hacking,RandomStats[3]);
		
		if( bIsRandHP==true){						
			Soldier.setBaseMaxStat(eStat_HP,RandomStats[4]);
			Soldier.setCurrentStat(eStat_HP,RandomStats[4]);
			}	

		if( bIsRandDodge==true){						
			Soldier.setBaseMaxStat(eStat_Dodge,RandomStats[5]);
			Soldier.setCurrentStat(eStat_Dodge,RandomStats[5]);
			}	

		if( bIsRandDef==true){						
			Soldier.setBaseMaxStat(eStat_Defense,RandomStats[6]);
			Soldier.setCurrentStat(eStat_Defense,RandomStats[6]);
			}	

		if( bIsRandCrit==true){						
			Soldier.setBaseMaxStat(eStat_CritChance,RandomStats[7]);
			Soldier.setCurrentStat(eStat_CritChance,RandomStats[7]);
			}	

}

function int EWRollStat( int iLow, int iHigh, int iMultiple )
{
	local int iSpread, iNewStat; 

	iSpread = iHigh - iLow;

	iNewStat = iLow + `SYNC_RAND( iSpread/iMultiple + 1 ) * iMultiple;

	//Used to give a 50% "Crit" on the roll. 
		if( iNewStat == iHigh && `SYNC_RAND(2) == 0 && bIsRollCrit==true)
			iNewStat += iMultiple;

	return iNewStat;
}

