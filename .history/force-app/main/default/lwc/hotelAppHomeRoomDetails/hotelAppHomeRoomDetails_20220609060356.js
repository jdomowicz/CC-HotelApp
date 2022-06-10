import { LightningElement,wire,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Room__c.Name',
    'Room__c.Available__c',
    'Room__c.Hotel__c',
    'Room__c.Mini_Bar__c',
    'Room__c.photo_url__c',
    'Room__c.Room_Number__c',
    'Room__c.Type'
    ];

export default class HotelAppHomeRoomDetails extends LightningElement {


    recordId = 'a017Q00000lzxhrQAA';

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

}