import { LightningElement, api, track, wire } from 'lwc';
import getReturnValue from "@salesforce/apex/returnValue.getReturnValue";
import ACCOUNT_ID from '@salesforce/schema/Customer_Report__c.Account__c';


export default class createRecordForm extends LightningElement {
  @api recordId;
  @wire(getReturnValue, { recordId: '$recordId', fields: [ ACCOUNT_ID ] })
   account;
   accountId;
   @wire(getReturnValue, { accountId: this.accountId() })

   handleSuccess(event) {
       this.accountId = event.detail.id;
   }
   handleUpdate(event) {
     let customerReportType = event.target.value;
     this.resetInitialValues();
     getCustomerReportInfo({customerReport: customerReportType})
     .then(result => {
       let reportInfo = JSON.parse(result);
       if(reportInfo.length > 0){
         this.code = reportInfo[0].Code__c;
         this.title = reportInfo[0].Title__c;
         this.note = reportInfo[0].Note__c;
         this.dataSource = reportInfo[0].Data_Source__c;
         this.ico = reportInfo[0].ICO__c;
         this.frequency = this.getOptions(reportInfo[0].Frequency__c);
         
         this.isParcel = (reportInfo[0].Parcel__c == '1' ? true : false);
         this.isFTC = (reportInfo[0].FTC__c == '1' ? true : false);
         this.template = reportInfo[0].Template__c;

        //  this.ico = false;
        //  this.schedule = false;
        //  this.frequency = false;
      
         }else {
         this.resentInitialValues();
       }
     })
     .catch(error => {
       this.dispatchEvent(new ShowToastEvent({
         title: error.name,
         massage: error.message,
         variant:'error',
          }));
     })
   }
}