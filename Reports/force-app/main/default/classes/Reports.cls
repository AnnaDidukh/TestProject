public with sharing class Reports {
    @AuraEnabled        
        public static Customer_Report__c getReports(String cr) {
            cr='COD%';
            Customer_Report__c opp = [SELECT Id,Title__c,Template__c,Note__c,Schedule__c,Parcel__c,ICO__c,FTP__c,Frequency__c, Data_Source__c,External_Id__c, Code__c, Customer_Report__c FROM Customer_Report__c Where Customer_Report__c = : cr];
            return opp;
        }
}