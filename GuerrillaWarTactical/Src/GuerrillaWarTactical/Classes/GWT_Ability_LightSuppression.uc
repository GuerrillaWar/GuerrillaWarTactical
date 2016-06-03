class GWT_Ability_LightSuppression extends X2Ability;

var localized string SuppressionTargetEffectDesc;
var localized string SuppressionSourceEffectDesc;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(LightSuppression());
	Templates.AddItem(LightSuppressionShot());

	return Templates;
}

static function X2AbilityTemplate LightSuppression()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ReserveActionPoints      ReserveActionPointsEffect;
	local GWT_Effect_LightSuppression		SuppressionEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LightSuppression');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_supression";

	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 2;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bConsumeAllPoints = true;   //  this will guarantee the unit has at least 1 action point
	ActionPointCost.bFreeCost = true;           //  ReserveActionPoints effect will take all action points away
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	
	Template.AddShooterEffectExclusions();

	ReserveActionPointsEffect = new class'X2Effect_ReserveActionPoints';
	ReserveActionPointsEffect.ReserveType = 'Suppression';
	Template.AddShooterEffect(ReserveActionPointsEffect);

	Template.AbilityToHitCalc = default.DeadEye;	
	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	SuppressionEffect = new class'GWT_Effect_LightSuppression';
	SuppressionEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	SuppressionEffect.bRemoveWhenTargetDies = true;
	SuppressionEffect.bRemoveWhenSourceDamaged = true;
	SuppressionEffect.bBringRemoveVisualizationForward = true;
	SuppressionEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, default.SuppressionTargetEffectDesc, Template.IconImage);
	SuppressionEffect.SetSourceDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.SuppressionSourceEffectDesc, Template.IconImage);
	Template.AddTargetEffect(SuppressionEffect);

	Template.AssociatedPassives.AddItem('HoloTargeting');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.bDisplayInUITooltip = false;
	Template.AdditionalAbilities.AddItem('LightSuppressionShot');
	Template.bIsASuppressionEffect = true;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SuppressionBuildVisualization;
	Template.BuildAppliedVisualizationSyncFn = SuppressionBuildVisualizationSync;
	Template.CinescriptCameraType = "StandardSuppression";

	Template.Hostility = eHostility_Offensive;

	return Template;	
}

simulated function SuppressionBuildVisualization(XComGameState VisualizeGameState, out array<VisualizationTrack> OutVisualizationTracks)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          InteractingUnitRef;

	local VisualizationTrack        EmptyTrack;
	local VisualizationTrack        BuildTrack;

	local XComGameState_Ability         Ability;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	BuildTrack = EmptyTrack;
	BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	BuildTrack.TrackActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
	
	class'X2Action_ExitCover'.static.AddToVisualizationTrack(BuildTrack, Context);
	class'X2Action_StartSuppression'.static.AddToVisualizationTrack(BuildTrack, Context);
	OutVisualizationTracks.AddItem(BuildTrack);
	//****************************************************************************************
	//Configure the visualization track for the target
	InteractingUnitRef = Context.InputContext.PrimaryTarget;
	Ability = XComGameState_Ability(History.GetGameStateForObjectID(Context.InputContext.AbilityRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1));
	BuildTrack = EmptyTrack;
	BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	BuildTrack.TrackActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTrack(BuildTrack, Context));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, Ability.GetMyTemplate().LocFlyOverText, '', eColor_Bad);
	if (XComGameState_Unit(BuildTrack.StateObject_OldState).ReserveActionPoints.Length != 0 && XComGameState_Unit(BuildTrack.StateObject_NewState).ReserveActionPoints.Length == 0)
	{
		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTrack(BuildTrack, Context));
		SoundAndFlyOver.SetSoundAndFlyOverParameters(none, class'XLocalizedData'.default.OverwatchRemovedMsg, '', eColor_Bad);
	}
	OutVisualizationTracks.AddItem(BuildTrack);
}

simulated function SuppressionBuildVisualizationSync(name EffectName, XComGameState VisualizeGameState, out VisualizationTrack BuildTrack)
{
	local X2Action_ExitCover ExitCover;

	if (EffectName == class'GWT_Effect_LightSuppression'.default.EffectName)
	{
		ExitCover = X2Action_ExitCover(class'X2Action_ExitCover'.static.AddToVisualizationTrack( BuildTrack, VisualizeGameState.GetContext() ));
		ExitCover.bIsForSuppression = true;

		class'X2Action_StartSuppression'.static.AddToVisualizationTrack( BuildTrack, VisualizeGameState.GetContext() );
	}
}

static function X2AbilityTemplate LightSuppressionShot()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ReserveActionPoints ReserveActionPointCost;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2AbilityTrigger_Event	        Trigger;
	local array<name>                       SkipExclusions;
	local X2Condition_UnitEffectsWithAbilitySource TargetEffectCondition;
	local X2Effect_RemoveEffects            RemoveSuppression;
	local X2Effect                          ShotEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LightSuppressionShot');

	Template.bDontDisplayInAbilitySummary = true;
	ReserveActionPointCost = new class'X2AbilityCost_ReserveActionPoints';
	ReserveActionPointCost.iNumPoints = 1;
	ReserveActionPointCost.AllowedTypes.AddItem('LightSuppression');
	Template.AbilityCosts.AddItem(ReserveActionPointCost);
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bReactionFire = true;
	Template.AbilityToHitCalc = StandardAim;
	Template.AbilityToHitOwnerOnMissCalc = StandardAim;

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);

	TargetEffectCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	TargetEffectCondition.AddRequireEffect(class'GWT_Effect_LightSuppression'.default.EffectName, 'AA_UnitIsNotSuppressed');
	Template.AbilityTargetConditions.AddItem(TargetEffectCondition);

	TargetVisibilityCondition = new class'X2Condition_Visibility';	
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);
	Template.bAllowAmmoEffects = true;

	RemoveSuppression = new class'X2Effect_RemoveEffects';
	RemoveSuppression.EffectNamesToRemove.AddItem(class'GWT_Effect_LightSuppression'.default.EffectName);
	RemoveSuppression.bCheckSource = true;
	RemoveSuppression.SetupEffectOnShotContextResult(true, true);
	Template.AddShooterEffect(RemoveSuppression);
	
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	//Trigger on movement - interrupt the move
	Trigger = new class'X2AbilityTrigger_Event';
	Trigger.EventObserverClass = class'X2TacticalGameRuleset_MovementObserver';
	Trigger.MethodName = 'InterruptGameState';
	Template.AbilityTriggers.AddItem(Trigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_supression";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	//don't want to exit cover, we are already in suppression/alert mode.
	Template.bSkipExitCoverWhenFiring = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bAllowFreeFireWeaponUpgrade = true;	

	return Template;	
}