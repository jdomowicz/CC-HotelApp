import { LightningElement,api } from 'lwc';

import cloneRecords from '@salesforce/apex/CloneRecordController.cloneRecords';

export default class CloneRecords extends LightningElement {
    @api recordId;


    cloneRecord(){

    }


}