import { LightningElement,wire } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

import roomMessageChannel from '@salesforce/messageChannel/roomMessageChannel';

import {publish,MessageContext} from 'lightning/messageService';

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

        publish(this.messageContext, recordSelected, payload);
    }

    // Respond to UI event by publishing message
    handleContactSelect(event) {
        const payload = { recordId: event.target.contact.Id };

        
    }

}