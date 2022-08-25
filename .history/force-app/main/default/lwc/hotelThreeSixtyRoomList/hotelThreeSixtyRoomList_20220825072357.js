import { LightningElement,wire } from 'lwc';
import roomList from '@salesforce/apex/roomController.roomList';
import recordSelected from '@salesforce/messageChannel/hotelId__c';

import {
    subscribe,
    APPLICATION_SCOPE,
    MessageContext
} from 'lightning/messageService';

const dataColumns = [
    {label:'Room Number',fieldName:'Room_Number__c'},
    {label:'Name',fieldName:'Name'},
    {label:'Type',fieldName:'Type__c'},
    {label:'Max Number of Guests',fieldName:'Max_Number_of_Guests__c'},
    {label:'Available',fieldName:'Available__c'},
    {label:'Jacuzzi',fieldName:'Jacuzzi__c'}

];



export default class HotelThreeSixtyRoomList extends LightningElement {

    subscription = null;

    roomList;
    dataColumns = dataColumns;
    hotelValue;
    recordId;
    roomListEmpty = false;

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
            console.log('this object is empty: ' , this.roomList === null)
            this.roomListEmpty = true;
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