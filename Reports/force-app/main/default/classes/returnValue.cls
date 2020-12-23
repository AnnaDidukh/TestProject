public with sharing class returnValue {
    @AuraEnabled(cacheable=true)
    public static List<Customer_Report__c> getReturnValue(Id accountId) {
    return [SELECT Id,Title__c,Template__c,Note__c,Schedule__c,Parcel__c,ICO__c,FTP__c,Frequency__c, 
    Data_Source__c,External_Id__c, Code__c FROM Customer_Report__c WHERE AccountId = :accountId]; 
    }
 }
