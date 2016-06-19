class GWT_Ability_Suppression extends Object dependson(GWT_AbilityCost_WeaponConditionalAmmo);

var localized string SuppressionTargetEffectDesc;
var localized string SuppressionSourceEffectDesc;

static function UpdateSuppressionAbility()
{
	local X2AbilityTemplateManager Manager;
	local array<X2AbilityTemplate> Templates;
	local X2AbilityTemplate Template;
	local WeaponAmmoCostMapping CostMapping, BlankCostMapping;
	local GWT_Effect_Suppression SuppressionEffect;
	local GWT_AbilityCost_WeaponConditionalAmmo   AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;

	Manager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	Manager.FindAbilityTemplateAllDifficulties('Suppression', Templates);

	foreach Templates(Template)
	{
		Template.AbilityCosts.Length = 0;

		AmmoCost = new class'GWT_AbilityCost_WeaponConditionalAmmo';

		CostMapping = BlankCostMapping;
		CostMapping.WeaponCat = 'rifle';
		CostMapping.Cost = 4;
		AmmoCost.WeaponAmmoCosts.AddItem(CostMapping);

		CostMapping = BlankCostMapping;
		CostMapping.WeaponCat = 'cannon';
		CostMapping.Cost = 2;
		AmmoCost.WeaponAmmoCosts.AddItem(CostMapping);

		Template.AbilityCosts.AddItem(AmmoCost);
	
		ActionPointCost = new class'X2AbilityCost_ActionPoints';
		ActionPointCost.bConsumeAllPoints = true;   //  this will guarantee the unit has at least 1 action point
		ActionPointCost.bFreeCost = true;           //  ReserveActionPoints effect will take all action points away
		Template.AbilityCosts.AddItem(ActionPointCost);

		SuppressionEffect = GWT_Effect_Suppression(Template.AbilityTargetEffects[0]); // get first effect
		SuppressionEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, default.SuppressionTargetEffectDesc, Template.IconImage);
		SuppressionEffect.SetSourceDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.SuppressionSourceEffectDesc, Template.IconImage);
	}

}
