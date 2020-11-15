# Garrys-Mod-Addon_Halo-SPV3
 A Garry's Mod Addon focused on implementing the NPC's and their features from the Halo CE mod, "SPV3" into Garry's Mod. Originally created by Mayhem.

Changes that are different and WIP comapred to the workshop version:
[list]
   -Sentinels are now much much more effective against large swaths of flood (can hit more than 1 target per sweep)
   -Added 8 additional voice permutations for marines
   -Added hitgroups and dismemberment to Flood Marine
   -Added hitgroups and dismemberment to Flood Elite
   -Added Energy Sword
   -Added proper Berserking for Elites
   -Higher-ranked elites will randomly pull out swords when shields deplete
   -Added ability for Elite suicide runners to spawn from transformations
   -Added crouching animation/capability to marines, elites, brutes, and grunts
   -Added Rifle/Missile holdtype to Grunts
   -Added evasion to marines
   -Changed evasion code for Elites, Brutes, and Jackals (So they evade when fighting other NPCs too and not just players)
   -Added flying death animations for all relevant NPCs
   -Changed infection forms and made them feel more "floaty"
      	-Infection forms now explode on contact with shields
      	-Infection forms deal double damage to active shields
      	-Removed collision between infection form and its target
      	-Reduced friction on infection forms
      	-Infection forms now attach to individual bones
      	-Infection forms can now pile onto enemies, and will jump off once one of them has taken over
      	-Infection forms can no longer be meleed/damaged by the entity they are attached to
      	-Modified airborne animation to make it more "wiggly" and last longer
      	-Added climbing animations for when climbing nodes are available
      	-Added jumping capabilities (Node related)
      	-Added some randomization in their leaping to spread them out a bit more as a swarm
   -Changed default infection count Modifier 1->2.5
   -Increased health on Marine and ODST combat forms to be inline with increased marine health from last update
   -Changed around weapon tables within UNSC faction
   -Removed unnecessary file causing error upon load in
   -Fixed various bones, so weapons are wielded better
   -Fixed Flood jackal retaining colors of host but applying it to the flesh as well
   -Marines (and sub types) can use Covie grenades if they're allowed to use Covie weapons
   -Brutes (and sub types) can use Human grenades if they're allowed to use Human weapons
   -Chief can now use all grenade types rather than just frags
   -Elites will not flinch/stagger unless their shields are depleted
   -Infection forms now slightly pulsate with a glow
   -Added moving sound to infection forms
   -Lowered volume of infector chomping sfx
   -Seem to have fixed phantom infection forms spawned from Carriers(?) 
   -Fixed marines not receiving correct blast damage from explosions
   -Fixed needler nade causing errors in certain situations
   -Fixed elite combat forms not using skins (better coloring)
   -Loosened requirements "infect_onlyhalo"
[/list]