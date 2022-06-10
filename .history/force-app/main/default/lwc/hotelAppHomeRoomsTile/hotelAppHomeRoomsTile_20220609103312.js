import { LightningElement,wire } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

import SELECTED_ID from '@salesforce/messageChannel/roomId__c';

import {publish,MessageContext} from 'lightning/messageService';

export default class HotelAppHomeRoomsTile extends LightningElement {

    roomList;
    roomId = 'a017Q00000lzxhuQAA';

    @wire(MessageContext)
    messageContext;

    connectedCallback(){
    this.getRoomList()
    publish(this.messageContext, roomIdChannel,  {roomId: this.roomId });
    console.log('event has been dispatched')
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

        this.roomId = event.target.dataset.id;
        publish(this.messageContext, SELECTED_ID,  {roomId: this.roomId });
        console.log('message dispatched',this.roomId)
    }

}