import { LightningElement,wire } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

import roomMessageChannel from '@salesforce/messageChannel/roomMessageChannel';

import {subscribe,APPLICATION_SCOPE,MessageContext} from 'lightning/messageService';

export default class HotelAppHomeRoomsTile extends LightningElement {

    @wire(MessageContext)
    messageContext;

    roomList;

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
    }

}