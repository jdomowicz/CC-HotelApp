import { LightningElement, wire } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

import RESERVATION_OBJECT from '@salesforce/schema/Reservation__c';
import RESERVATION_NAME from '@salesforce/schema/Reservation__c.Name';
import RESERVATION_ROOM from '@salesforce/schema/Reservation__c.Room__c';
import RESERVATION_CHECKIN from '@salesforce/schema/Reservation__c.Check_In_Date__c';
import RESERVATION_CHECKOUT from '@salesforce/schema/Reservation__c.Check_out_Date__c';
import RESERVATION_GUEST from '@salesforce/schema/Reservation__c.Guest_name__c';
import RESERVATION_BREAKFAST from '@salesforce/schema/Reservation__c.Breakfast__c';
import RESERVATION_BREAKFASTTYPE from '@salesforce/schema/Reservation__c.Breakfast_Type__c';

import {subscribe,MessageContext} from 'lightning/messageService';

import SELECTED_ID from '@salesforce/messageChannel/roomId__c';
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

export default class HotelAppHomeRoomDetails extends NavigationMixin(LightningElement) {

    reservation_Object = RESERVATION_OBJECT;

    reservationFields = [RESERVATION_NAME,RESERVATION_ROOM,RESERVATION_CHECKIN,RESERVATION_CHECKOUT,RESERVATION_GUEST,RESERVATION_BREAKFAST,RESERVATION_BREAKFASTTYPE];

    

    recordId;
    roomName
    Available__c
    Mini_Bar__c
    photo_url__c
    Room_Number__c
    Type__c
    tv__c
    hotel
    hotelName
    roomIdSubscription;

        //Wire message context
     @wire(MessageContext)
     messageContext;


    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    rooomData({ data, error }) {

        if (data) {
                this.roomName = data.fields.Name.value,
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

     @wire(getRecord, { recordId: '$hotel', fields: HOTEL_NAME })
     hotelData({data,error}){
         if(data){
            this.hotelName = data.fields.Name.value;
         }
         if(error){
             console.error(error)
         }
     }


    openRecord(){
        this.navigateToRecordPage();
    }

     navigateToRecordPage() {
        // Navigate to the Record page
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Room__c',
                actionName: 'view',
            },
        });
    }


     // Encapsulate logic for Lightning message service subscribe and unsubsubscribe
  subscribeHandler(){
       this.roomIdSubscription =  subscribe(this.messageContext,SELECTED_ID,(message)=>this.handleSelectedId(message))
    }


    // Handler for message received by component
    handleSelectedId(message){
        this.recordId = message.roomId;
    }

    connectedCallback() {
        this.subscribeHandler();
    }



}