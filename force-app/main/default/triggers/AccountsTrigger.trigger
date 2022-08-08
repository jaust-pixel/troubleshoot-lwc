/**
 * @description       : 
 * @author            : Jonah Austin (OpFocus)
 * @group             : OpFocus
 * @last modified on  : 2022-08-07
 * @last modified by  : Jonah Austin (OpFocus)
**/
trigger AccountsTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    fflib_SObjectDomain.triggerHandler(Accounts.class);
}