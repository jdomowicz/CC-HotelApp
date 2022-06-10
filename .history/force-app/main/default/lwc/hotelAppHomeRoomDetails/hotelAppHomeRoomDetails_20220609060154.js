import { LightningElement,wire,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class HotelAppHomeRoomDetails extends LightningElement {


    recordId;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

}