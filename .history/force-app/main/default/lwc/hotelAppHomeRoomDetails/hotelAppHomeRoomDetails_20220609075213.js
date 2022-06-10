import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

import HOTEL_NAME from '@salesforce/schema/Hotel__c.Name';

const FIELDS = [
    'Room__c.Name',
    'Room__c.Available__c',
    'Room__c.Hotel__c',
    'Room__c.Mini_Bar__c',
    'Room__c.photo_url__c',
    'Room__c.Room_Number__c',
    'Room__c.Type__c',
    'Room__c.tv__c',
    'Room__c.Max_Number_of_Guests__c'
];

export default class HotelAppHomeRoomDetails extends LightningElement {

    recordId = 'a017Q00000lzxhrQAA';
    Name
    Available__c
    Mini_Bar__c
    photo_url__c
    Room_Number__c
    Type__c
    tv__c
    hotel
    hotelName

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    rooomData({ data, error }) {

        if (data) {

            console.log(data)

            this.Name = data.fields.Name.value,
                this.Available__c = data.fields.Available__c.value,
                this.Mini_Bar__c = data.fields.Mini_Bar__c.value,
                this.photo_url__c = data.fields.photo_url__c.value,
                this.Room_Number__c = data.fields.Room_Number__c.value,
                this.Type__c = data.fields.Type__c.value,
                this.tv__c = data.fields.tv__c.value,
                this.Max_Number_of_Guests__c = data.fields.Max_Number_of_Guests__c.value,
                this.hotel = data.fields.Hotel__c.value


        }
        if (error) {
            console.error(error);
        }
    }


     @wire(getRecord, { recordId: '$hotel', fields: {HOTEL_NAME })
     hotelData({data,error}){
         if(data){
             console.log(data)
         }
         if(error){
             console.error(error)
         }
     }


    openRecord(){

    }

}