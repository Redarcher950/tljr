/*
 *  Script generated by LS Script Generator, v.TK.0
 *
 *  For download info, please visit:
 *  http://nwvault.ign.com/View.php?view=Other.Detail&id=1502
 */
// Put this under "Actions Taken" in the conversation editor.


#include "nw_i0_generic"


void main()
{
    object oSpawn;
    effect eVFX;
    effect eDamage;

    // Get the PC who is in this conversation.
    object oPC = GetPCSpeaker();

    // Cause damage.
    eDamage = EffectDamage(d100(), DAMAGE_TYPE_NEGATIVE);
    eDamage = EffectDamage(d100(), DAMAGE_TYPE_NEGATIVE);
    eDamage = EffectDamage(d100(), DAMAGE_TYPE_NEGATIVE);
    eDamage = EffectDamage(d100(), DAMAGE_TYPE_NEGATIVE);
    eVFX = EffectVisualEffect(VFX_IMP_HARM);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX   , oPC);

    // Spawn "summon".
    eVFX = EffectVisualEffect(VFX_IMP_DEATH_WARD);
    oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "tukata001", GetLocation(oPC));
    AssignCommand(oSpawn, DetermineCombatRound(oPC));
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oSpawn));
}

