class X2Item_RifleArchtypePatch extends X2AmbientNarrativeCriteria;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	local XComGameStateHistory History;
	local XComGameStateContext_StrategyGameRule StrategyStartContext;
	local XComGameState StartState;
	local XComGameState_CampaignSettings Settings;
	local int DifficultyIndex;

	return Templates; // Disabled

	History = `XCOMHISTORY;

	StrategyStartContext = XComGameStateContext_StrategyGameRule(class'XComGameStateContext_StrategyGameRule'.static.CreateXComGameStateContext());
	StrategyStartContext.GameRuleType = eStrategyGameRule_StrategyGameStart;
	StartState = History.CreateNewGameState(false, StrategyStartContext);
	History.AddGameStateToHistory(StartState);

	Settings = new class'XComGameState_CampaignSettings'; // Do not use CreateStateObject() here
	StartState.AddStateObject(Settings);

	for( DifficultyIndex = `MIN_DIFFICULTY_INDEX; DifficultyIndex <= `MAX_DIFFICULTY_INDEX; ++DifficultyIndex )
	{
		Settings.SetDifficulty(DifficultyIndex);
		`log("Difficulty:"@string(class'XComGameState_CampaignSettings'.static.GetDifficultyFromSettings()),, 'SuppressionRilfe');

		ChangeArchType('AssaultRifle_CV', "GuerrillaWarTactical.WP_AssaultRifle_CV");
		ChangeArchType('AssaultRifle_MG', "GuerrillaWarTactical.WP_AssaultRifle_MG");
		ChangeArchType('AssaultRifle_BM', "GuerrillaWarTactical.WP_AssaultRifle_BM");
		ChangeArchType('AdvCaptainM1_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvCaptainM1_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvCaptainM2_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvCaptainM3_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvShieldBearerM2_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvShieldBearerM3_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvStunLancerM1_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvStunLancerM2_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvStunLancerM3_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvTrooperM1_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvTrooperM2_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
		ChangeArchType('AdvTrooperM3_WPN', "GuerrillaWarTactical.WP_AssaultRifle_MG_Advent");
	}
	History.ResetHistory(); // Discard the history



	Templates.Length = 0;
	return Templates;
}

static function ChangeArchType(name TemplateName, String ArchetypeStr)
{
	local X2ItemTemplateManager ItemMgr;
	local X2WeaponTemplate Template;

	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	Template = X2WeaponTemplate(ItemMgr.FindItemTemplate(TemplateName));

	if (Template == none)
	{
		`redscreen(TemplateName @ "Weapon not found");
		return;
	}

	Template.GameArchetype = ArchetypeStr;

	//DEBUG: Adding suppression to test
	//Template.Abilities.AddItem('Suppression');

	ItemMgr.AddItemTemplate(Template, true);
}