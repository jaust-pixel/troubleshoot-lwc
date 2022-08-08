/**
 * @description       : 
 * @author            : Jonah Austin (OpFocus)
 * @group             : OpFocus
 * @last modified on  : 2022-08-07
 * @last modified by  : Jonah Austin (OpFocus)
**/
public with sharing class Accounts extends fflib_SObjectDomain {

    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }

    public override void onApplyDefaults() {
        for (Account acc : (List<Account>) Records) {
            acc.Description = 'Domain classes rock!';
        }
    }

    public override void onBeforeUpdate(Map<Id,SObject> existingRecords) {
        for (Account acc : (List<Account>) Records) {
            Account oldAcc = (Account) existingRecords.get(acc.Id);
            acc.AnnualRevenue = acc.Description.getLevenshteinDistance(oldAcc.Description);
        }
    }

}
