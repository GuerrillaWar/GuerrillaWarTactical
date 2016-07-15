class UISL_WeaponArchetypePatcher extends UIScreenListener config(Game);

struct SuppressAnimationPatcher
{
	var string ArchetypeName;
	var name AnimationName;
};

var config array<SuppressAnimationPatcher> PATCH_ANIMATIONS;

event OnInit(UIScreen Screen)
{
	local SuppressAnimationPatcher Patcher;
	local XComWeapon Weap;
	if (UIMessageMgr(Screen) != none)
	{
		foreach default.PATCH_ANIMATIONS(Patcher)
		{
			`log("Attempting to patch" @ Patcher.ArchetypeName,, 'SuppressionPatcher');
			Weap = XComWeapon(`CONTENT.RequestGameArchetype(Patcher.ArchetypeName));
			if (Weap != none)
			{
				Weap.WeaponSuppressionFireAnimSequenceName = Patcher.AnimationName;
				`log("Patched to" @  Patcher.AnimationName,, 'SuppressionPatcher');
			}
		}
	}
}