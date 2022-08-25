import { LightningElement,wire } from 'lwc';
import roomList from '@salesforce/apex/roomController.roomList';
import recordSelected from '@salesforce/messageChannel/hotelId__c';

import {
    subscribe,
    APPLICATION_SCOPE,
    MessageContext
} from 'lightning/messageService';

const dataColumns = [
    {label:'Name',fieldName:'Name'},
    {label:'Id',fieldName:'Id'},
    {label:'Name',fieldName:'Available__c'},
    {label:'Id',fieldName:'Mini_Bar__c'},
    {label:'Name',fieldName:'Jacuzzi__c'},
   
];

Select Id,Name,Hotel__r.Name,Available__c,occupied__c,Mini_Bar__c,Jacuzzi__c,Air_Condition__c,Room_Number__c,Max_Number_of_Guests__c,Type__c,Room_Number__c,service__c from Room__c

export default class HotelThreeSixtyRoomList extends LightningElement {

    subscription = null;

    roomList;
    dataColumns = dataColumns;
    hotelValue;
    recordId;

    @wire(MessageContext)
    messageContext;

      // Encapsulate logic for Lightning message service subscribe and unsubsubscribe
   subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                recordSelected,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    //  Handler for message received by component
    handleMessage(message) {
        this.hotelValue = message.hotelId;
        this.getRoomListDropdown();
    }

     getRoomListDropdown() {

        roomList({h: this.hotelValue }).then((result) => {
            this.roomList = result;
        console.log(this.roomList);
        }).catch((error) => {
            console.error(error);
        })
    }

    connectedCallback(){
        this.getRoomListDropdown();
        this.subscribeToMessageChannel();

    }

}