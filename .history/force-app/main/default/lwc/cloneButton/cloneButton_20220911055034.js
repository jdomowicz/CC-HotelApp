import { LightningElement,api } from 'lwc';

import cloneRecords from '@salesforce/apex/CloneRecordController.cloneRecords';

export default class CloneButton extends LightningElement {

  @api ClassName;
  @api RecordId;

    cloneRecords(){

        cloneRecords({recordId:this.RecordId,className:this.ClassName}).then(result)=>{

            s

        }


    }


}