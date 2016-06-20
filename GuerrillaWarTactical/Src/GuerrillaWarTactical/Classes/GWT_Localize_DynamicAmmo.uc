// This is an Unreal Script

class GWT_Localize_DynamicAmmo extends XGLocalizeTag
        dependson(GWT_AbilityCost_WeaponConditionalAmmo);

var Object ParseObj;

event ExpandHandler(string InString, out string OutString)
{
	local name Type;
	local XComGameStateHistory History;
	local X2AbilityTemplate AbilityTemplate;
	local XComGameState_Ability AbilityState;
	local XComGameState_Effect EffectState;
	local XComGameState_Unit TargetUnitState;
	local GWT_Effect_Suppression Effect;
	local GWT_AbilityCost_WeaponConditionalAmmo AmmoCost;
	local int Idx;

	Type = name(InString);
	History = `XCOMHISTORY;

	switch (Type)
	{
		case 'COST':
			OutString = "0";
			AbilityTemplate = X2AbilityTemplate(ParseObj);
			AbilityState = XComGameState_Ability(ParseObj);
			TargetUnitState = XComGameState_Unit(ParseObj);
			if (AbilityTemplate == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				if (AbilityState != none)
					AbilityTemplate = AbilityState.GetMyTemplate();
			}
			if (AbilityTemplate != none)
			{
				for (Idx = 0; Idx < AbilityTemplate.AbilityCosts.Length; ++Idx)
				{
					AmmoCost = GWT_AbilityCost_WeaponConditionalAmmo(AbilityTemplate.AbilityCosts[Idx]);
					if (AmmoCost != none)
					{
						OutString = string(AmmoCost.CalcAmmoCost(
							AbilityState,
							AbilityState.GetSourceWeapon(),
							TargetUnitState
						));
						break;
					}
				}
			}
			break;
	}

	// no tag found
	if (OutString == "")
	{
		`RedScreenOnce("Unhandled localization tag: '"$Tag$":"$InString$"'");
		OutString = "<GWTDynamicAmmo:"$InString$"/>";
	}
}

DefaultProperties
{
	Tag = "GWTDynamicAmmo";
}
