import { LightningElement } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';

export default class Selector extends LightningElement {
    selectedProductId;

    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }
}
