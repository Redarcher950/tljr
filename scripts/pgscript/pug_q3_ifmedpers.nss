//::///////////////////////////////////////////////
//:: FileName pug_q3_ifmedpers
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 28/05/2009 12:04:38 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Perform skill checks
	if(!(AutoDC(DC_MEDIUM, SKILL_PERSUADE, GetPCSpeaker())))
		return FALSE;

	return TRUE;
}
