/**
 * @description       : 
 * @author            : Jonah Austin (OpFocus)
 * @group             : OpFocus
 * @last modified on  : 2022-08-07
 * @last modified by  : Jonah Austin (OpFocus)
**/
@RestResource(urlMapping = '/case/*/close')
global with sharing class CaseCloseResource {

    @HttpPost
    global static void closeCase(String closeReason) {
        // Parse context
        RestRequest req = RestContext.request;
        String[] uriParts = req.requestURI.split('/');
        Id caseId = uriParts[2];
        CaseService.closeCases(new Set<Id>{caseId}, closeReason);
    }

}
