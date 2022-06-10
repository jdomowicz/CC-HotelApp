import { LightningElement,wire,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Room__c.Name',
    'Room__c.Available__c',
    'Room__c.Hotel__c',
    'Room__c.Mini_Bar__c',
    'Room__c.photo_url__c',
    'Room__c.Room_Number__c',
    'Room__c.Type__c',
    'Room__c.tv__c'
    ];

export default class HotelAppHomeRoomDetails extends LightningElement {


    recordId = 'a017Q00000lzxhrQAA';

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    rooomData({data,error}){
        if(data){
            data
        }
    }

}