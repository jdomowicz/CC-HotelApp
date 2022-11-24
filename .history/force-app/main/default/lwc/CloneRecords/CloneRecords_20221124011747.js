import { LightningElement,api } from 'lwc';

import cloneRecords from '@salesforce/apex/SOLID/CloneRecordController.CloneRecordController';

export default class CloneRecords extends LightningElement {
    @api recordId;


    cloneRecord(){

    }


}