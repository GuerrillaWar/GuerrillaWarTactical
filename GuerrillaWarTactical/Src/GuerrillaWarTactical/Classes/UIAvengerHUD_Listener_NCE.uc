// This is an Unreal Script

class UIAvengerHUD_Listener_NCE extends UIScreenListener Config(NCE);

// Set this value in the defaultproperties to filter UI signals based on class
var class<UIScreen> ScreenClass;
var array <float> StatArray;


// This event is triggered after a screen receives focus
event OnReceiveFocus(UIScreen Screen)
{
	local XComGameState_Unit Unit;
	local XComGameState_NCE NCEObject;
	local X2CharacterTemplate template;
	local int counter;

//Checks the four most common modified base stats and randomizes if they match character base stats.
	counter=0;
	template= class'X2Character_DefaultCharacters'.static.CreateSoldierTemplate();
	NCEObject= new class 'XComGameState_NCE';
	//`log("Mod ScreenListener Activated");
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Unit', Unit )
	{
		//`log("Mod Foreach in listener");
		if (Unit != None)
		{
			if(Unit.IsSoldier() && Unit.GetRank()==0 && !Unit.IsAlien())
			{	
				//`log("Stats Plz");
				counter=0;
				if(Unit.GetCurrentStat(eStat_Offense)==template.CharacterBaseStats[eStat_Offense]){counter++;
				//`log("Off, Counter +1");
				}
				if(Unit.GetCurrentStat(eStat_Hacking)==template.CharacterBaseStats[eStat_Hacking]){counter++;
				//`log("Hack, Counter +1");
				}
				if(Unit.GetCurrentStat(eStat_Mobility)==template.CharacterBaseStats[eStat_Mobility]){counter++;
				//`log("Mob, Counter +1");
				}
				if(Unit.GetCurrentStat(eStat_Will)==template.CharacterBaseStats[eStat_Will]){counter++;
				//`log("Will, Counter +1");
				}
				if(counter>3)
				{
					NCEObject.RandomStats(Unit);
					counter=0;
					//`log("Stats YES");
				}
			}
			if(Unit.GetSoldierClassTemplateName() == 'Spark' && Unit.GetRank()==1 && !Unit.IsAlien() && NCEObject.bIsRandSparks==true)
			{	
				//`log("Spark Stats Plz");
				counter=0;
				if(Unit.GetCurrentStat(eStat_Offense)==template.CharacterBaseStats[eStat_Offense]){counter++;
				//`log("Off, Counter +1");
				}
				if(Unit.GetCurrentStat(eStat_Hacking)==template.CharacterBaseStats[eStat_Hacking]){counter++;
				//`log("Hack, Counter +1");
				}
				if(Unit.GetCurrentStat(eStat_Mobility)==template.CharacterBaseStats[eStat_Mobility]){counter++;
				//`log("Mob, Counter +1");
				}
				if(counter>2)
				{
					NCEObject.RandomStats(Unit);
					counter=0;
					//`log("Spark Stats YES");
				}
			}
		}
	}
}

defaultproperties
{
	// Leaving this assigned to none will cause every screen to trigger its signals on this class
	ScreenClass=UIAvengerHUD;
}
