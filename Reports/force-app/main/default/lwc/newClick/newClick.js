import { LightningElement, api, track, wire } from 'lwc';
import getReturnValue from "@salesforce/apex";
import Customer_Report__c from "c/customerReport";


export default class createRecordForm extends LightningElement {
   accountId;
   handleSuccess(event) {
       this.accountId = event.detail.id;
   }
  //  @api rep1;
  //   @wire(getReturnValue, { rep1: Customer_Report__c }) returnValue;
}