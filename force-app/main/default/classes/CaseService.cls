/**
 * @description       : 
 * @author            : Jonah Austin (OpFocus)
 * @group             : OpFocus
 * @last modified on  : 2022-08-07
 * @last modified by  : Jonah Austin (OpFocus)
**/
public with sharing class CaseService {
    
    public static void closeCases(Set<Id> caseIds, String closeReason) {
        if (String.isBlank(closeReason)) {
            return;
        }
        List<Case> casesToClose = new List<Case>();
        for (Case caseRecord : [SELECT Id, Status, Reason FROM Case WHERE Id IN :caseIds]) {
            caseRecord.Reason = closeReason;
            caseRecord.Status = 'Closed';
            casesToClose.add(caseRecord);
        }

        if (!casesToClose.isEmpty()) {
            update casesToClose;
        }
    }
}
