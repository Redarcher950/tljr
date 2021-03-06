//::///////////////////////////////////////////////
//:: TAILOR: right 2 left
//::                     onconv mil_tailor
//:://////////////////////////////////////////////
/*
   check our local string for what we're swapping
   "SYMMETRYTYPE" =
        arms
        legs
        both

*/
//:://////////////////////////////////////////////
//:: Created By: bloodsong
//-- cobbled from lots of milambus's routines
//:://////////////////////////////////////////////



void main()
{
    string sSym = GetLocalString(OBJECT_SELF, "SYMMETRYTYPE");

    int iSourceValue;  //-- read from parts
    object oNew, oCurrent; //-- items we'll iterate through
    object oSource = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);

    //-- step zero: create a duplicate to start modifying.
    oNew = CopyItem(oSource, OBJECT_SELF);

    //-- step one: copy arms
    if (sSym == "arms" || sSym == "both")
    {
        //--A: get #s from one side to the other

       // Right Bicep
       iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RBICEP);
       oCurrent = oNew;
       oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LBICEP, iSourceValue, TRUE);
       DestroyObject(oCurrent);

        // Right Forearm
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RFOREARM);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LFOREARM, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // Right Hand
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RHAND);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LHAND, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // Right Shoulder
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RSHOULDER);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LSHOULDER, iSourceValue, TRUE);
        DestroyObject(oCurrent);

    }  //-- end ARMS copying


    if (sSym == "legs" || sSym == "both")
    {
       //-- same thing, for leg parts
        // Right Thigh
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RTHIGH);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LTHIGH, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // Right Shin
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RSHIN);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LSHIN, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // Right Foot
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RFOOT);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LFOOT, iSourceValue, TRUE);
        DestroyObject(oCurrent);

    }  //-- end LEGS



    //-- step last: destroy the original clothing, and put on the new

    DestroyObject(oSource);

    AssignCommand(OBJECT_SELF, ActionEquipItem(oNew, INVENTORY_SLOT_CHEST));

}
