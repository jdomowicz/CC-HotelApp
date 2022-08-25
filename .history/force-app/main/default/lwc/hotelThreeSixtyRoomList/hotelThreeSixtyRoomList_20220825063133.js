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
    hotelid = 'a007Q000004E0lQQAS';

//    @wire(MessageContext)
 //   messageContext;
/*
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
        this.recordId = message.hotelId;
        console.log('id retrived from message channel' , this.recordId);
    }
*/

     getRoomListDropdown() {
        console.log('get room start');
        console.log('this hoter id mapped from getRoom list ',this.hotelid);
        roomList({h: this.hotelid }).then((result) => {
            this.roomList = result;
        console.log(this.roomList.data);
        }).catch((error) => {
            console.error(error);
        })
    }

    connectedCallback(){
        console.log('connect callback start');
        this.getRoomListDropdown();
      //  this.subscribeToMessageChannel();
     //    console.log('message channel ended');
      //  console.log('getRoomList Handled');

    }

}