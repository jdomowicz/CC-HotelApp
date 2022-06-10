import { LightningElement,wire } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

import roomMessageChannel from '@salesforce/messageChannel/roomId__c';

import {publish,MessageContext} from 'lightning/messageService';

export default class HotelAppHomeRoomsTile extends LightningElement {

    roomList;
    roomId;

    @wire(MessageContext)
    messageContext;

    connectedCallback(){
    this.getRoomList()
    }

     getRoomList(){

        roomDisplayList().then((result)=>{

            this.roomList = result;
            console.log(result);

        }).catch((error)=>{
            console.error(error);
        })

    }

    selectedRoom(event){

        console.log(this.roomId);
        this.roomId = event.target.dataset.id;
        publish(this.messageContext, roomMessageChannel,  {roomId: this.roomId });
    }

}