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
    {label:'Id',fieldName:'Id'}
];

export default class HotelThreeSixtyRoomList extends LightningElement {

    subscription = null;

    roomList;
    dataColumns = dataColumns;
    hotelValue = 'a007Q00000AFc6GQAT';
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