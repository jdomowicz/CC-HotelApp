import { LightningElement,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class HotelAppHomeRoomDetails extends LightningElement {


    export default class WireGetRecordDynamicContact extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

}