// This is an Unreal Script

class GWT_InsertBaseWeaponAbilities extends Object;

static function AddBaseAbilitiesToWeapons()
{
	local X2ItemTemplate Item;
	local X2GrenadeLauncherTemplate GrenadeLauncher;
	local X2WeaponTemplate Weapon;
	local X2ItemTemplateManager ItemManager;
	local name AbilityName;

	ItemManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// I thought this would work to add the abilities that classes come with standard but its not enough
	// Gremlin skills work but nothing else does.
	GrenadeLauncher = X2GrenadeLauncherTemplate(ItemManager.FindItemTemplate('GrenadeLauncher_CV'));
	GrenadeLauncher.Abilities.AddItem('LaunchGrenade');
	GrenadeLauncher.Abilities.AddItem('GWT_LoadGrenades');
	ItemManager.AddItemTemplate(GrenadeLauncher, true);

	GrenadeLauncher = X2GrenadeLauncherTemplate(ItemManager.FindItemTemplate('GrenadeLauncher_MG'));
	GrenadeLauncher.Abilities.AddItem('LaunchGrenade');
	GrenadeLauncher.Abilities.AddItem('GWT_LoadGrenades');
	ItemManager.AddItemTemplate(GrenadeLauncher, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Gremlin_CV'));
	Weapon.Abilities.AddItem('AidProtocol');
	Weapon.Abilities.AddItem('IntrusionProtocol');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Gremlin_MG'));
	Weapon.Abilities.AddItem('AidProtocol');
	Weapon.Abilities.AddItem('IntrusionProtocol');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Gremlin_BM'));
	Weapon.Abilities.AddItem('AidProtocol');
	Weapon.Abilities.AddItem('IntrusionProtocol');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Pistol_CV'));
	Weapon.Abilities.AddItem('PistolStandardShot');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Pistol_MG'));
	Weapon.Abilities.AddItem('PistolStandardShot');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Pistol_BM'));
	Weapon.Abilities.AddItem('PistolStandardShot');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('SniperRifle_CV'));
	Weapon.Abilities.AddItem('Squadsight');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('SniperRifle_MG'));
	Weapon.Abilities.AddItem('Squadsight');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('SniperRifle_BM'));
	Weapon.Abilities.AddItem('Squadsight');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Sword_CV'));
	Weapon.Abilities.AddItem('SwordSlice');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Sword_MG'));
	Weapon.Abilities.AddItem('SwordSlice');
	ItemManager.AddItemTemplate(Weapon, true);

	Weapon = X2WeaponTemplate(ItemManager.FindItemTemplate('Sword_BM'));
	Weapon.Abilities.AddItem('SwordSlice');
	ItemManager.AddItemTemplate(Weapon, true);

	GrenadeLauncher = X2GrenadeLauncherTemplate(ItemManager.FindItemTemplate('GrenadeLauncher_CV'));
	`log("Gren Launcher Ability List");
	foreach GrenadeLauncher.Abilities(AbilityName)
	{
		`log("Ability:" @ AbilityName);
	}
}