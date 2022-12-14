import { LightningElement, api } from "lwc";
import { NavigationMixin } from 'lightning/navigation';

import cloneRecord from "@salesforce/apex/CloneRecordSolidController.cloneRecord";

export default class CloneRecords extends NavigationMixin(LightningElement) {
    @api recordId;
    @api className;
    @api objectApiName;
    newRecord;
    newRecordId;

    cloneRecordTrigger() {
        console.log("button is being clicked!");
        console.log(
            "Class Name Passed: ",
            this.className,
            " recordId Passed: ",
            this.recordId
        );

    cloneRecord({ recordId: this.recordId, className: this.className })
      .then((result) => {
        this.newRecord = result;
        this.newRecordId = result.Id;
        console.log(this.newRecord);
        console.log(this.objectApiName);
      })
      .catch((error) => {
        console.log(error);
      });

    }

    navigateRecord() {
       this[NavigationMixin.Navigate]({
           type: 'standard__recordPage',
           attributes: {
               recordId: this.newRecordId,
               objectApiName: this.objectApiName,
               actionName: 'view'
           },
       });
   }

}