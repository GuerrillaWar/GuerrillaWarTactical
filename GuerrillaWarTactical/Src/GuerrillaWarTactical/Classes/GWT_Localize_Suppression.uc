// This is an Unreal Script

class GWT_Localize_Suppression extends XGLocalizeTag dependson(GWT_Effect_Suppression);

var Object ParseObj;

event ExpandHandler(string InString, out string OutString)
{
	local name Type;
	local XComGameStateHistory History;
	local XComGameState_Ability AbilityState;
	local XComGameState_Effect EffectState;
	local XComGameState_Unit TargetUnitState;
	local GWT_Effect_Suppression Effect;


	Type = name(InString);
	History = `XCOMHISTORY;

	switch (Type)
	{
		case 'SUPPRESSIONPENALTY':
			if (`XENGINE.IsMultiplayerGame())
			{
				OutString = string(class'GWT_Effect_Suppression'.default.Multiplayer_AimPenalty);
			}
			else
			{
				OutString = string(class'GWT_Effect_Suppression'.default.Soldier_AimPenalty);
				EffectState = XComGameState_Effect(ParseObj);
				AbilityState = XComGameState_Ability(ParseObj);
				TargetUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

				OutString = string(Effect.GetAimModifierFromAbility(AbilityState, TargetUnitState));
				`log("Translating OutString:" @ OutString);
			}
			break;

	}

	// no tag found
	if (OutString == "")
	{
		`RedScreenOnce("Unhandled localization tag: '"$Tag$":"$InString$"'");
		OutString = "<GWTSuppression:"$InString$"/>";
	}
}

DefaultProperties
{
	Tag = "GWTSuppression";
}
