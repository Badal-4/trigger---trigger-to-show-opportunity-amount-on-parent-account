//trigger to update opportunity amount on parent account
trigger trg3 on Opportunity(after Insert,after Update,after Delete,after Undelete)
{
    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete))
    {
        trgController.trgMethod(trigger.newMap,null);
    }
    else if(trigger.isAfter && trigger.isUpdate)
    {
        trgController.trgMethod(trigger.newMap,trigger.oldMap);
    }
    else if(trigger.isAfter && trigger.isDelete)
    {
        trgController.trgMethod(trigger.oldMap,null);
    }
}
