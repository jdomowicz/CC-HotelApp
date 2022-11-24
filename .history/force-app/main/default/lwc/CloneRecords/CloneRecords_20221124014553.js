import { LightningElement, api } from "lwc";

import cloneRecord from "@salesforce/apex/CloneRecordSolidController.cloneRecord";

export default class CloneRecords extends LightningElement {
  @api recordId;
  @api ClassName;

  newRecord;



  cloneRecord() {
    console.log("button is being clicked!");

    console.log(
      "Class Name Passed: ",
      this.ClassName,
      " recordId Passed: ",
      this.recordId
    );

    cloneRecord({ recordId: this.recordId, ClassName: 'cloneOppty' })
      .then((result) => {
        this.newRecord = result;
      })
      .catch((error) => {
        console.log('Error triggered');
        console.log(error);
      });
  }

}
