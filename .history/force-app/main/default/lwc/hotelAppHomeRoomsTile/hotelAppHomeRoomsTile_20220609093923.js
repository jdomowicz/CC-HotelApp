import { LightningElement,wire } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

import roomMessageChannel from '@salesforce/messageChannel/roomMessageChannel';

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

        console.log(event.target.dataset.id);
        this.roomId = event.target.dataset.id;

        publish(this.messageContext, roomMessageChannel,  { recordId: event.target.contact.Id });
    }

}