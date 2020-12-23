trigger first on Account (before insert) {
    List<Customer_Report__c> dat = [SELECT Frequency__c,Template__c FROM Customer_Report__c
    WHERE AccountId IN :Trigger.New];          
    for(Customer_Report__c cr : dat) {      
    if (cr.Frequency__c = 'M') {
        cr.Template__c = 'M COD_SETTLEMENT 1 ';
        
        insert cr;
    }

    if (cr.Frequency__c = 'D') {
        cr.Template__c = ' D COD_SETTLEMENT 1 ';
           insert cr;    
    }
    }
}