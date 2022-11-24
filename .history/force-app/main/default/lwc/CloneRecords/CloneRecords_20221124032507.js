import { LightningElement, api } from "lwc";

import cloneRecord from "@salesforce/apex/CloneRecordSolidController.cloneRecord";

export default class CloneRecords extends LightningElement {
    @api recordId;
    @api className;
    newRecord;


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
        console.log(this.newRecord);
      })
      .catch((error) => {
        console.log(error);
      });

    }

}
