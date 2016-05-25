//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_GuerrillaWarTactical.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_GuerrillaWarTactical extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{
	AddBaseAbilitiesToWeapons();
}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{
	AddBaseAbilitiesToWeapons();
}

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

static event OnPostTemplatesCreated()
{
	`log("GuerrillaWarTactical :: Present and Correct");
	AddBaseAbilitiesToWeapons();
}