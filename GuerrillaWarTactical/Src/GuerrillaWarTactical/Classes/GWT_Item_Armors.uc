class GWT_Item_Armors extends Object;

static function UpdateItemArmorTemplates()
{
	local X2ItemTemplateManager Manager;
	Manager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	KevlarArmor(X2ArmorTemplate(Manager.FindItemTemplate('KevlarArmor')));
	MediumPlatedArmor(X2ArmorTemplate(Manager.FindItemTemplate('MediumPlatedArmor')));
	LightPlatedArmor(X2ArmorTemplate(Manager.FindItemTemplate('LightPlatedArmor')));
	HeavyPlatedArmor(X2ArmorTemplate(Manager.FindItemTemplate('HeavyPlatedArmor')));
	MediumPoweredArmor(X2ArmorTemplate(Manager.FindItemTemplate('MediumPoweredArmor')));
	LightPoweredArmor(X2ArmorTemplate(Manager.FindItemTemplate('LightPoweredArmor')));
	HeavyPoweredArmor(X2ArmorTemplate(Manager.FindItemTemplate('HeavyPoweredArmor')));
}

static function KevlarArmor(X2ArmorTemplate Template)
{
	Template.UIStatMarkups.Remove(0, Template.UIStatMarkups.Length);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 0, true);
	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);
}

static function MediumPlatedArmor(X2ArmorTemplate Template)
{
	Template.UIStatMarkups.Remove(0, Template.UIStatMarkups.Length);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'GWT_Ability_Armors'.default.PREDATOR_ARMOR_BONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_Ability_Armors'.default.PREDATOR_MOBILITY_BONUS);

	Template.bInfiniteItem = false;

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);
}

static function LightPlatedArmor(X2ArmorTemplate Template)
{
	Template.UIStatMarkups.Remove(0, Template.UIStatMarkups.Length);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'GWT_Ability_Armors'.default.SPIDERSUIT_ARMOR_BONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_Ability_Armors'.default.SPIDERSUIT_MOBILITY_BONUS);

	Template.bOneTimeBuild = false;
	Template.bInfiniteItem = false;

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);
}

static function HeavyPlatedArmor(X2ArmorTemplate Template)
{
	Template.UIStatMarkups.Remove(0, Template.UIStatMarkups.Length);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'GWT_Ability_Armors'.default.EXO_ARMOR_BONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_Ability_Armors'.default.EXO_MOBILITY_BONUS);

	Template.bOneTimeBuild = false;
	Template.bInfiniteItem = false;

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);
}

static function MediumPoweredArmor(X2ArmorTemplate Template)
{
	Template.UIStatMarkups.Remove(0, Template.UIStatMarkups.Length);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'GWT_Ability_Armors'.default.WARDEN_ARMOR_BONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_Ability_Armors'.default.WARDEN_MOBILITY_BONUS);

	Template.bInfiniteItem = false;

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);
}

static function LightPoweredArmor(X2ArmorTemplate Template)
{
	Template.UIStatMarkups.Remove(0, Template.UIStatMarkups.Length);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'GWT_Ability_Armors'.default.WRAITHSUIT_ARMOR_BONUS);	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_Ability_Armors'.default.WRAITHSUIT_MOBILITY_BONUS);

	Template.bOneTimeBuild = false;
	Template.bInfiniteItem = false;

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);
}

static function HeavyPoweredArmor(X2ArmorTemplate Template)
{
	Template.UIStatMarkups.Remove(0, Template.UIStatMarkups.Length);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'GWT_Ability_Armors'.default.WARSUIT_ARMOR_BONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'GWT_Ability_Armors'.default.WARSUIT_MOBILITY_BONUS);

	Template.bOneTimeBuild = false;
	Template.bInfiniteItem = false;

	class'X2ItemTemplateManager'.static.GetItemTemplateManager().AddItemTemplate(Template, true);
}