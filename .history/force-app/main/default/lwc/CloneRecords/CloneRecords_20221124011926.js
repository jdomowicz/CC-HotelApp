import { LightningElement, api } from "lwc";

import cloneRecords from "@salesforce/apex/SOLID/CloneRecordController.CloneRecordController";

export default class CloneRecords extends LightningElement {
  @api recordId;
  @api ClassName;

  newRecord;
  showFields = "false";
  objectApiName = "Account";

  cloneRecord() {
    console.log("button is being clicked!");

    console.log(
      "Class Name Passed: ",@api ClassName;
  @api recordId;
  newRecord;
  showFields = 'false';
  objectApiName = 'Account';
      this.ClassName,
      " recordId Passed: ",
      this.recordId
    );

    cloneRecords({ recordId: this.recordId, className: this.ClassName })
      .then((result) => {
        this.newRecord = result;
        this.showFields = "true";
      })
      .catch((error) => {
        console.log(error);
      });
  }
}
