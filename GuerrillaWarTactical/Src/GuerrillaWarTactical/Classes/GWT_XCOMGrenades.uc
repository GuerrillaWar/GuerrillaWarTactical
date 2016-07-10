class GWT_XCOMGrenades extends X2Item config(GWT_WeaponStats);

// ***** Grenade Variables *****
//*** Config var declarations
var config int GRENADE_SOUND_RANGE;

// Mk1 grenades
var config WeaponDamageValue FRAGGRENADE_BASEDAMAGE;
var config WeaponDamageValue ACIDGRENADEM1_BASEDAMAGE;
var config WeaponDamageValue FIREGRENADEM1_BASEDAMAGE;
var config WeaponDamageValue GASGRENADEM1_BASEDAMAGE;
var config WeaponDamageValue EMPGRENADEM1_BASEDAMAGE;

// Mk2 grenades
var config WeaponDamageValue ALIENGRENADE_BASEDAMAGE;
var config WeaponDamageValue ACIDGRENADEM2_BASEDAMAGE;
var config WeaponDamageValue FIREGRENADEM2_BASEDAMAGE;
var config WeaponDamageValue GASGRENADEM2_BASEDAMAGE;
var config WeaponDamageValue EMPGRENADEM2_BASEDAMAGE;
var config WeaponDamageValue PROXIMITYMINE_BASEDAMAGE;

// non-damaging grenades
var config WeaponDamageValue FLASHBANGGRENADE_BASEDAMAGE;
var config WeaponDamageValue SMOKEGRENADE_BASEDAMAGE;



var config int FIREBOMB_ISOUNDRANGE;
var config int FIREBOMB_IENVIRONMENTDAMAGE;
var config int FIREBOMB_ISUPPLIES;
var config int FIREBOMB_TRADINGPOSTVALUE;
var config int FIREBOMB_IPOINTS;
var config int FIREBOMB_ICLIPSIZE;
var config int FIREGRENADE_RANGE;
var config int FIREGRENADE_RADIUS;
var config int FIREBOMB_RANGE;
var config int FIREBOMB_RADIUS;

var config int FRAGGRENADE_ISOUNDRANGE;
var config int FRAGGRENADE_IENVIRONMENTDAMAGE;
var config int FRAGGRENADE_ISUPPLIES;
var config int FRAGGRENADE_TRADINGPOSTVALUE;
var config int FRAGGRENADE_IPOINTS;
var config int FRAGGRENADE_ICLIPSIZE;
var config int FRAGGRENADE_RANGE;
var config int FRAGGRENADE_RADIUS;

var config int ALIENGRENADE_ISOUNDRANGE;
var config int ALIENGRENADE_IENVIRONMENTDAMAGE;
var config int ALIENGRENADE_ISUPPLIES;
var config int ALIENGRENADE_TRADINGPOSTVALUE;
var config int ALIENGRENADE_IPOINTS;
var config int ALIENGRENADE_ICLIPSIZE;
var config int ALIENGRENADE_RANGE;
var config int ALIENGRENADE_RADIUS;

var config int FLASHBANGGRENADE_ISOUNDRANGE;
var config int FLASHBANGGRENADE_IENVIRONMENTDAMAGE;
var config int FLASHBANGGRENADE_ISUPPLIES;
var config int FLASHBANGGRENADE_TRADINGPOSTVALUE;
var config int FLASHBANGGRENADE_IPOINTS;
var config int FLASHBANGGRENADE_ICLIPSIZE;
var config int FLASHBANGGRENADE_RANGE;
var config int FLASHBANGGRENADE_RADIUS;

var config int SMOKEGRENADE_ISOUNDRANGE;
var config int SMOKEGRENADE_IENVIRONMENTDAMAGE;
var config int SMOKEGRENADE_ISUPPLIES;
var config int SMOKEGRENADE_TRADINGPOSTVALUE;
var config int SMOKEGRENADE_IPOINTS;
var config int SMOKEGRENADE_ICLIPSIZE;
var config int SMOKEGRENADE_RANGE;
var config int SMOKEGRENADE_RADIUS;
var config int SMOKEGRENADEMK2_RANGE;
var config int SMOKEGRENADEMK2_RADIUS;

var config int GASGRENADE_ISOUNDRANGE;
var config int GASGRENADE_IENVIRONMENTDAMAGE;
var config int GASGRENADE_ISUPPLIES;
var config int GASGRENADE_TRADINGPOSTVALUE;
var config int GASGRENADE_IPOINTS;
var config int GASGRENADE_ICLIPSIZE;
var config int GASGRENADE_RANGE;
var config int GASGRENADE_RADIUS;
var config int GASBOMB_RANGE;
var config int GASBOMB_RADIUS;

var config int ACIDGRENADE_ISOUNDRANGE;
var config int ACIDGRENADE_IENVIRONMENTDAMAGE;
var config int ACIDGRENADE_ISUPPLIES;
var config int ACIDGRENADE_TRADINGPOSTVALUE;
var config int ACIDGRENADE_IPOINTS;
var config int ACIDGRENADE_ICLIPSIZE;
var config int ACIDGRENADE_RANGE;
var config int ACIDGRENADE_RADIUS;
var config int ACIDBOMB_RANGE;
var config int ACIDBOMB_RADIUS;

var config int GRENADELAUNCHER_ISOUNDRANGE;
var config int GRENADELAUNCHER_IENVIRONMENTDAMAGE;
var config int GRENADELAUNCHER_ISUPPLIES;
var config int GRENADELAUNCHER_TRADINGPOSTVALUE;
var config int GRENADELAUNCHER_IPOINTS;
var config int GRENADELAUNCHER_ICLIPSIZE;
var config int GRENADELAUNCHER_RANGEBONUS;
var config int GRENADELAUNCHER_RADIUSBONUS;

var config int ADVGRENADELAUNCHER_ISOUNDRANGE;
var config int ADVGRENADELAUNCHER_IENVIRONMENTDAMAGE;
var config int ADVGRENADELAUNCHER_ISUPPLIES;
var config int ADVGRENADELAUNCHER_TRADINGPOSTVALUE;
var config int ADVGRENADELAUNCHER_IPOINTS;
var config int ADVGRENADELAUNCHER_ICLIPSIZE;
var config int ADVGRENADELAUNCHER_RANGEBONUS;
var config int ADVGRENADELAUNCHER_RADIUSBONUS;

var config int EMPGRENADE_RANGE;
var config int EMPGRENADE_RADIUS;
var config int EMPGRENADE_HACK_DEFENSE_CHANGE;

var config int EMPBOMB_RANGE;
var config int EMPBOMB_RADIUS;
var config int EMPBOMB_HACK_DEFENSE_CHANGE;

var config int PROXIMITYMINE_RANGE;
var config int PROXIMITYMINE_RADIUS;

var localized string SmokeGrenadeEffectDisplayName;
var localized string SmokeGrenadeEffectDisplayDesc;
var config int SMOKEGRENADE_HITMOD;

static function UpdateXCOMGrenadeTemplates()
{
	local X2ItemTemplateManager Manager;
	Manager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	CreateFirebomb(X2GrenadeTemplate(Manager.FindItemTemplate('Firebomb')));
	CreateFirebombMK2(X2GrenadeTemplate(Manager.FindItemTemplate('FirebombMK2')));
	CreateAlienGrenade(X2GrenadeTemplate(Manager.FindItemTemplate('AlienGrenade')));
	CreateFlashbangGrenade(X2GrenadeTemplate(Manager.FindItemTemplate('FlashbangGrenade')));
	CreateSmokeGrenade(X2GrenadeTemplate(Manager.FindItemTemplate('SmokeGrenade')));
	CreateSmokeGrenadeMk2(X2GrenadeTemplate(Manager.FindItemTemplate('SmokeGrenadeMk2')));
	CreateGasGrenade(X2GrenadeTemplate(Manager.FindItemTemplate('GasGrenade')));
	CreateGasGrenadeMk2(X2GrenadeTemplate(Manager.FindItemTemplate('GasGrenadeMk2')));
	CreateAcidGrenade(X2GrenadeTemplate(Manager.FindItemTemplate('AcidGrenade')));
	CreateAcidGrenadeMk2(X2GrenadeTemplate(Manager.FindItemTemplate('AcidGrenadeMk2')));
	GrenadeLauncher(X2GrenadeLauncherTemplate(Manager.FindItemTemplate('GrenadeLauncher_CV')));
	AdvGrenadeLauncher(X2GrenadeLauncherTemplate(Manager.FindItemTemplate('GrenadeLauncher_MG')));
	EMPGrenade(X2GrenadeTemplate(Manager.FindItemTemplate('EMPGrenade')));
	EMPGrenadeMk2(X2GrenadeTemplate(Manager.FindItemTemplate('EMPGrenadeMk2')));
	ProximityMine(X2GrenadeTemplate(Manager.FindItemTemplate('ProximityMine')));
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Grenades;

	Grenades.AddItem(CreateFragGrenade());

	return Grenades;
}

static function CreateFirebomb(X2GrenadeTemplate Template)
{
	Template.iRange = default.FIREGRENADE_RANGE;
	Template.iRadius = default.FIREGRENADE_RADIUS;
	

	Template.BaseDamage = default.FIREGRENADEM1_BASEDAMAGE;
	Template.iSoundRange = default.FIREBOMB_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.FIREBOMB_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.FIREBOMB_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.FIREBOMB_IPOINTS;
	Template.iClipSize = default.FIREBOMB_ICLIPSIZE;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.FIREGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.FIREGRENADE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.FIREGRENADEM1_BASEDAMAGE.Shred);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function CreateFirebombMK2(X2GrenadeTemplate Template)
{
	Template.iRange = default.FIREBOMB_RANGE;
	Template.iRadius = default.FIREBOMB_RADIUS;

	Template.BaseDamage = default.FIREGRENADEM2_BASEDAMAGE;
	Template.iSoundRange = default.FIREBOMB_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.FIREBOMB_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.FIREBOMB_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.FIREBOMB_IPOINTS;
	Template.iClipSize = default.FIREBOMB_ICLIPSIZE;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);


	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.FIREBOMB_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.FIREBOMB_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.FIREGRENADEM2_BASEDAMAGE.Shred);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}


static function CreateAlienGrenade(X2GrenadeTemplate Template)
{

	local ArtifactCost Resources;

	Template.iRange = default.ALIENGRENADE_RANGE;
	Template.iRadius = default.ALIENGRENADE_RADIUS;

	Template.BaseDamage = default.ALIENGRENADE_BASEDAMAGE;
	Template.iSoundRange = default.ALIENGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ALIENGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.ALIENGRENADE_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.ALIENGRENADE_IPOINTS;
	Template.iClipSize = default.ALIENGRENADE_ICLIPSIZE;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);

	Template.bInfiniteItem = false;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 80;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.ALIENGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.ALIENGRENADE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.ALIENGRENADE_BASEDAMAGE.Shred);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function CreateFlashbangGrenade(X2GrenadeTemplate Template)
{
	Template.iRange = default.FLASHBANGGRENADE_RANGE;
	Template.iRadius = default.FLASHBANGGRENADE_RADIUS;
	
	Template.iSoundRange = default.FLASHBANGGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.FLASHBANGGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = 10;
	Template.PointsToComplete = default.FLASHBANGGRENADE_IPOINTS;
	Template.iClipSize = default.FLASHBANGGRENADE_ICLIPSIZE;
	Template.Tier = 0;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.FLASHBANGGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.FLASHBANGGRENADE_RADIUS);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function CreateSmokeGrenade(X2GrenadeTemplate Template)
{
	Template.iRange = default.SMOKEGRENADE_RANGE;
	Template.iRadius = default.SMOKEGRENADE_RADIUS;

	Template.iSoundRange = default.SMOKEGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SMOKEGRENADE_IENVIRONMENTDAMAGE;
	Template.PointsToComplete = default.SMOKEGRENADE_IPOINTS;
	Template.iClipSize = default.SMOKEGRENADE_ICLIPSIZE;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SMOKEGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.SMOKEGRENADE_RADIUS);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function CreateSmokeGrenadeMk2(X2GrenadeTemplate Template)
{
	Template.iRange = default.SMOKEGRENADEMK2_RANGE;
	Template.iRadius = default.SMOKEGRENADEMK2_RADIUS;

	Template.iSoundRange = default.SMOKEGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SMOKEGRENADE_IENVIRONMENTDAMAGE;
	Template.PointsToComplete = default.SMOKEGRENADE_IPOINTS;
	Template.iClipSize = default.SMOKEGRENADE_ICLIPSIZE;

	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SMOKEGRENADEMK2_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.SMOKEGRENADEMK2_RADIUS);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function CreateGasGrenade(X2GrenadeTemplate Template)
{
	Template.iRange = default.GASGRENADE_RANGE;
	Template.iRadius = default.GASGRENADE_RADIUS;

	Template.BaseDamage = default.GASGRENADEM1_BASEDAMAGE;
	Template.iSoundRange = default.GASGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.GASGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.GASGRENADE_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.GASGRENADE_IPOINTS;
	Template.iClipSize = default.GASGRENADE_ICLIPSIZE;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.GASGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.GASGRENADE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.GASGRENADEM1_BASEDAMAGE.Shred);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function CreateGasGrenadeMk2(X2GrenadeTemplate Template)
{
	Template.iRange = default.GASBOMB_RANGE;
	Template.iRadius = default.GASBOMB_RADIUS;

	Template.BaseDamage = default.GASGRENADEM2_BASEDAMAGE;
	Template.iSoundRange = default.GASGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.GASGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.GASGRENADE_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.GASGRENADE_IPOINTS;
	Template.iClipSize = default.GASGRENADE_ICLIPSIZE;

	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.GASBOMB_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.GASBOMB_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.GASGRENADEM2_BASEDAMAGE.Shred);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function CreateAcidGrenade(X2GrenadeTemplate Template)
{
	Template.iRange = default.ACIDGRENADE_RANGE;
	Template.iRadius = default.ACIDGRENADE_RADIUS;

	Template.BaseDamage = default.ACIDGRENADEM1_BASEDAMAGE;
	Template.iSoundRange = default.ACIDGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ACIDGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.ACIDGRENADE_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.ACIDGRENADE_IPOINTS;
	Template.iClipSize = default.ACIDGRENADE_ICLIPSIZE;

	Template.bInfiniteItem = false;
	
	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.ACIDGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.ACIDGRENADE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.ACIDGRENADEM1_BASEDAMAGE.Shred);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function CreateAcidGrenadeMk2(X2GrenadeTemplate Template)
{

	Template.iRange = default.ACIDBOMB_RANGE;
	Template.iRadius = default.ACIDBOMB_RADIUS;

	Template.BaseDamage = default.ACIDGRENADEM2_BASEDAMAGE;
	Template.iSoundRange = default.ACIDGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ACIDGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.ACIDGRENADE_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.ACIDGRENADE_IPOINTS;
	Template.iClipSize = default.ACIDGRENADE_ICLIPSIZE;

	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.ACIDBOMB_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.ACIDBOMB_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.ACIDGRENADEM2_BASEDAMAGE.Shred);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function GrenadeLauncher(X2GrenadeLauncherTemplate Template)
{
	local ArtifactCost Resources;
	
	Template.iSoundRange = default.GRENADELAUNCHER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.GRENADELAUNCHER_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.GRENADELAUNCHER_TRADINGPOSTVALUE;
	Template.iClipSize = default.GRENADELAUNCHER_ICLIPSIZE;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);
	Template.IncreaseGrenadeRadius = default.GRENADELAUNCHER_RADIUSBONUS;
	Template.IncreaseGrenadeRange = default.GRENADELAUNCHER_RANGEBONUS;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 100;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRangeBonusLabel, , default.GRENADELAUNCHER_RANGEBONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRadiusBonusLabel, , default.GRENADELAUNCHER_RADIUSBONUS);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function AdvGrenadeLauncher(X2GrenadeLauncherTemplate Template)
{

	local ArtifactCost Resources;

	Template.iSoundRange = default.ADVGRENADELAUNCHER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ADVGRENADELAUNCHER_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.ADVGRENADELAUNCHER_ICLIPSIZE;


	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);
	Template.IncreaseGrenadeRadius = default.ADVGRENADELAUNCHER_RADIUSBONUS;
	Template.IncreaseGrenadeRange = default.ADVGRENADELAUNCHER_RANGEBONUS;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 180;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRangeBonusLabel, , default.ADVGRENADELAUNCHER_RANGEBONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRadiusBonusLabel, , default.ADVGRENADELAUNCHER_RADIUSBONUS);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function EMPGrenade(X2GrenadeTemplate Template)
{
	Template.iRange = default.EMPGRENADE_RANGE;
	Template.iRadius = default.EMPGRENADE_RADIUS;
	Template.BaseDamage = default.EMPGRENADEM1_BASEDAMAGE;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);

	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RoboticDamageLabel, , default.EMPGRENADEM1_BASEDAMAGE.Damage);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.EMPGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.EMPGRENADE_RADIUS);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function EMPGrenadeMk2(X2GrenadeTemplate Template)
{
	Template.iRange = default.EMPBOMB_RANGE;
	Template.iRadius = default.EMPBOMB_RADIUS;
	Template.BaseDamage = default.EMPGRENADEM2_BASEDAMAGE;

	Template.bInfiniteItem = false;
	
	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RoboticDamageLabel, , default.EMPGRENADEM2_BASEDAMAGE.Damage);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.EMPBOMB_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.EMPBOMB_RADIUS);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function ProximityMine(X2GrenadeTemplate Template)
{
	Template.iRange = default.PROXIMITYMINE_RANGE;
	Template.iRadius = default.PROXIMITYMINE_RADIUS;
	Template.BaseDamage = default.PROXIMITYMINE_BASEDAMAGE;

	Template.Abilities.AddItem('GRENADE_STATS');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_WeaponModifiers'.default.GRENADE_MOBILITY_BONUS);
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.PROXIMITYMINE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.PROXIMITYMINE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.PROXIMITYMINE_BASEDAMAGE.Shred);

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);

}

static function X2DataTemplate CreateFragGrenade()
{
	local X2GrenadeTemplate Template;
	local X2Effect_ApplyWeaponDamage WeaponDamageEffect;
	local X2Effect_Knockback KnockbackEffect;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'FragGrenade');

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Frag_Grenade";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.iRange = default.FRAGGRENADE_RANGE;
	Template.iRadius = default.FRAGGRENADE_RADIUS;

	Template.BaseDamage = default.FRAGGRENADE_BASEDAMAGE;
	Template.iSoundRange = default.FRAGGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.FRAGGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.FRAGGRENADE_TRADINGPOSTVALUE;
	Template.iClipSize = default.FRAGGRENADE_ICLIPSIZE;
	Template.DamageTypeTemplateName = 'Explosion';
	Template.Tier = 0;

	Template.CreatorTemplateName = 'FragGrenade_Schematic'; // The schematic which creates this item

	Template.Abilities.AddItem('ThrowGrenade');
	Template.Abilities.AddItem('GrenadeFuse');
	
	Template.GameArchetype = "WP_Grenade_Frag.WP_Grenade_Frag";

	Template.iPhysicsImpulse = 10;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);
	Template.LaunchedGrenadeEffects.AddItem(WeaponDamageEffect);

	Template.OnThrowBarkSoundCue = 'ThrowGrenade';

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.bUseTargetLocation = true; //This looks better for the animations used even though the source location should be used for grenades.
	KnockbackEffect.KnockbackDistance = 2;
	Template.ThrownGrenadeEffects.AddItem(KnockbackEffect);
	Template.LaunchedGrenadeEffects.AddItem(KnockbackEffect);

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 35;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.FRAGGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.FRAGGRENADE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.FRAGGRENADE_BASEDAMAGE.Shred);

	return Template;
}