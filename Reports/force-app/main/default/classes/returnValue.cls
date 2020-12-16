public with sharing class returnValue {

        public static List<Customer_Report__c> getReturnValue(String rep1) {
            rep1='COD%';
            Customer_Report__c thisReport = [
                SELECT Customer_Report__c FROM Customer_Report__c 
                WHERE Customer_Report__c like: rep1 LIMIT 1];
            
                return [SELECT Id,Title__c,Template__c,Note__c,Schedule__c,Parcel__c,ICO__c,FTP__c,Frequency__c, Data_Source__c,External_Id__c, Code__c, Customer_Report__c FROM Customer_Report__c 
            WHERE Customer_Report__c = :thisReport.Customer_Report__c ];
        }
 }