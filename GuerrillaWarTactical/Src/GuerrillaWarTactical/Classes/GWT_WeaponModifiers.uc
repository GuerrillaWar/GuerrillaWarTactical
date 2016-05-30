class GWT_WeaponModifiers extends X2Ability
	dependson (XComGameStateContext_Ability) config(GWT_WeaponStats);

//Stat bonus variables for weapons imported from XComGWT_WeaponStats
var config int ASSAULTRIFLE_MOBILITY_BONUS;
var config int SNIPERRIFLE_MOBILITY_BONUS;
var config int LMG_MOBILITY_BONUS;
var config int SHOTGUN_MOBILITY_BONUS;
var config int GRENADE_MOBILITY_BONUS;

static function array<X2DataTemplate> CreateTemplates()
{
	
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddAssaultRifleBonusAbility());
	Templates.AddItem(AddSniperRifleBonusAbility());
	Templates.AddItem(AddLMGBonusAbility());
	Templates.AddItem(AddShotgunBonusAbility());
	Templates.AddItem(AddGrenadeBonusAbility());
	
	return Templates;
}

// Stat Values

static function X2AbilityTemplate AddAssaultRifleBonusAbility()
{
	local X2AbilityTemplate					Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	`CREATE_X2ABILITY_TEMPLATE(Template, 'ASSAULT_RIFLE_STATS');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to Mobility stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.ASSAULTRIFLE_MOBILITY_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddSniperRifleBonusAbility()
{
	local X2AbilityTemplate					Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SNIPER_RIFLE_STATS');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to Mobility stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.SNIPERRIFLE_MOBILITY_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddLMGBonusAbility()
{
	local X2AbilityTemplate					Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	`CREATE_X2ABILITY_TEMPLATE(Template, 'LMG_STATS');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to Mobility stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.LMG_MOBILITY_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddShotgunBonusAbility()
{
	local X2AbilityTemplate					Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SHOTGUN_STATS');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to Mobility stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.SHOTGUN_MOBILITY_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddGrenadeBonusAbility()
{
	local X2AbilityTemplate					Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	`CREATE_X2ABILITY_TEMPLATE(Template, 'GRENADE_STATS');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to Mobility stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.GRENADE_MOBILITY_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}