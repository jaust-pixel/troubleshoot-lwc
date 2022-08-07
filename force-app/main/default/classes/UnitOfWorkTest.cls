/**
 * @description       : 
 * @author            : Jonah Austin (OpFocus)
 * @group             : OpFocus
 * @last modified on  : 2022-08-07
 * @last modified by  : Jonah Austin (OpFocus)
**/
@isTest
public with sharing class UnitOfWorkTest {

    @isTest
    static void challengeComplete() {

        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );

        for (Integer index = 0; index < 100; index++) {
            Account acc = new Account(Name = 'UoW Test Account ' + index);
            uow.registerNew(acc);
            for (Integer subIndex = 0; subIndex < 5; subIndex++) {
                Contact con = new Contact(LastName = 'Contact ' + subIndex, FirstName = 'UoW Test');
                uow.registerNew(con, Contact.AccountId, acc);
                Note reminder = new Note(Title = 'UoW Note ' + subIndex, Body = 'Note Contents ' + subIndex);
                uow.registerNew(reminder, Note.ParentId, acc);
            }
        }

        uow.commitWork();

        System.assertEquals(100, [SELECT Id FROM Account].size());
        System.assertEquals(500, [SELECT Id FROM Contact].size());
        System.assertEquals(500, [SELECT Id FROM Note].size());
    }

}
