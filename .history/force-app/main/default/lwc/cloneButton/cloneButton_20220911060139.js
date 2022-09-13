import { LightningElement,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

import cloneRecords from '@salesforce/apex/CloneRecordController.cloneRecords';

export default class CloneButton extends LightningElement {

  @api ClassName;
  @api recordId;
  error;

    cloneRecords(){

        console.log('button is being clicked!');

      /*  console.log('Class Name Passed: ',this.ClassName, ' recordId Passed: ',this.recordId);

        cloneRecords({recordId:this.recordId,className:this.ClassName}).then((result) => {
               console.log(result);
            }).catch((error) => {
                console.log(error);
            });

    }


}