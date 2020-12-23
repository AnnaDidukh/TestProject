trigger second on Account (after insert,after update) {
    List<Customer_Report__c> dat = [SELECT ICO__c,Parcel__c, FTP__c FROM Customer_Report__c
    WHERE AccountId IN :Trigger.New];          
    for(Customer_Report__c cr : dat) {   
    if ((Customer_Report__c.length() > 10)&&(Customer_Report__c.length() <=20)) {
        ICO__c=1;
        Parcel__c=1;
        FTP__c=1;
        insert cr;
    }
    if (Customer_Report__c.length() <= 10) {
        Parcel__c=2;
        FTP__c=2;
        insert cr;
    }
}
}

