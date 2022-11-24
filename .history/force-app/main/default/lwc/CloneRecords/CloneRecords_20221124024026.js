import { LightningElement, api } from "lwc";

import cloneRecord from "@salesforce/apex/CloneRecordSolidController.cloneRecord";

export default class CloneRecords extends LightningElement {
    @api recordId;
    @api className;
    newRecord;



    cloneRecord({ recordId: this.recordId, ClassName: 'cloneOppty' }) {
        console.log("button is being clicked!");
        console.log(
            "Class Name Passed: ",
            this.className,
            " recordId Passed: ",
            this.recordId
        );

         cloneRecord()
      .then((result) => {
        this.newRecord = result;
      })
      .catch((error) => {
        console.log('Error triggered');
        console.log(error);
      });

    }

}
