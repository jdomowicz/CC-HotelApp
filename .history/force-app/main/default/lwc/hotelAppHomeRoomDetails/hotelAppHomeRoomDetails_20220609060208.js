import { LightningElement,wire,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class HotelAppHomeRoomDetails extends LightningElement {


    recordId = 'a017Q00000lzxhrQAA';

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

}