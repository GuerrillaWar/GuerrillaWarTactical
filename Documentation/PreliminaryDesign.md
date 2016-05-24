# Guerrilla War Tactical
## Preliminary Design

This is an experimental overhaul of the game's tactical system, starting with
focus on XCOM's soldiers. Much of the abilities borne out of this overhaul
should be kicked on to an ADVENT overhaul down the track.

The overall concepts are as follows:
- remove all standard classes  (Sharpshooter, Grenadier, Ranger, Specialist)
- replace with a singular class, lets call it 'XCOM Operative'.
- remove weapon class restrictions, assume all soldiers have basic training in
  general usage of all weaponry.
- complement the removal of restrictions with more side effects, one of the
  easiest being mobility penalties based on weight.
- rebalance armour, health and damage types to encourage more variety in
  loadout choices and tactics in use.
- give 'staple' weapon specific abilities to the weapons themselves. Simple
  examples include giving Autocannons Suppression, and Assault Rifles
  light suppression.
- give the XCOM Operative's skill tree a broad set of veterancy perks which are
  not weapon specific. This would be a single class with perhaps 3 tracks,
  offensive, defensive, and stealth abilities.
- add an officer track for skills, much like LW's Officer Pack
- track weapon experience for units, allowing them to be trained in expertise
  of weapon categories for extra skills. (if this is hard to implement to begin
  with we can just add these skills to weapon abilities to test them out)


The goals of this design are:
- allow for more flexibility in loadout, with consequences for the choices made
- make the benefit from veterans less profound, so taking rookies out to fight
  isn't so risky
- make individual soldiers more unique when they're well developed
- make tactical choices more balanced in terms of viability, so a well
  balanced squad is encouraged via all choices supporting each other, rather
  than via random chance (the way XCOM gives your squad variety currently, GTS
  notwithstanding)



# Base Systems

Note, some of these tweaks are possibly implemented by mods

- [ ] raise base mobility for XCOM soldiers
- [ ] remove HP bonuses conferred by equipment, alter them to confer armor
      bonusses instead
- [ ] make armor shredding repairable, and shredding less common-place in
      weapon and ability design
- [ ] reduce environmental damage done by grenades and abilities, make it
      more exclusive to specific weapons or placeable explosives that have
      their own drawbacks

# Class Work

- [ ] remove or disable standard class templates
- [ ] create 'XCOM Operative' class template
- [ ] add support for more than 2 abilities per level, can probably just use
      http://steamcommunity.com/sharedfiles/filedetails/?id=640519326
- [ ] build out the veterancy tree

## XCOM Operative Tree
Keep in mind this is just a preliminary tree, balance is not the aim, merely
getting some sort of concept together with some abilities so we can tweak from
there.

Offensive, Defensive, and Stealth.

# 1 - Squaddie
No Base Ability

# 2 - Corporal
Offensive - Lighting Reflexes (+ dodge and + aim during movement)
Defensive - Steadfast (gain will)
Stealth - Phantom

# 3 - Sergeant
Offensive - 
Defensive - Opportunist (overwatch fire is not penalised on first shot)
Stealth - Lone Wolf (+ gain aim, mobility and crit when operating alone)

# 4 - Lieutenant
Offensive -
Defensive - Cover Reload (hunkering down will reload your weapon)
Stealth -

# 5 - Captain
Offensive - Close Combat Specialist (automatically react against enemies who
                                     move or attack in close proximity)
Defensive - 
Stealth -

# 6 - Major
Offensive -
Defensive - 
Stealth -

# 7 - Colonel
Offensive -
Defensive - Tactical Sense (gain defense for every enemy in sight)
Stealth - Sprinter (+ mobility)


# Equipment Work

- [ ] reduce environmental damage of grenades
- [ ] remove class restrictions of all weapons
- [ ] add sensible mobility penalties to all weapons to compensate for
      a soldiers higher base mobility
- [ ] add staple abilities to weapons

## Assault Rifle
- Conventional & Magnetic only - Light Suppression (-15 aim, uses 4 ammo)

## Autocannon
- Suppression (-30 aim, uses 2 ammo)
- Area Suppression (-15 aim, cone shape, uses all ammo, only one
  overwatch)

## Sniper Rifle
- Squadsight

- [ ] rebalance tiers under the following tenets:

## Conventional Weapons
- Good base damage
- No armor penetration
- Lightweight (-mobility)

## Magnetic Weapons
- Lower base damage
- Armor penetration
- Moderate weight (--mobility)

## Beam Weapons
- High damage
- Assault rifle lose suppression ability.
- Heavy weight (---mobility)





