import { LightningElement, api } from "lwc";

import cloneRecords from "@salesforce/apex/SOLID/CloneRecordController.cloneRecords";

export default class CloneRecords extends LightningElement {
  @api recordId;
  @api ClassName;

  newRecord;
  showFields = "false";
  objectApiName = "Account";


  cloneRecord() {
    console.log("button is being clicked!");

    console.log(
      "Class Name Passed: ",
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
