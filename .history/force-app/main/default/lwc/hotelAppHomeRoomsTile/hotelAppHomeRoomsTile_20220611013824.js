import { LightningElement,wire } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

import SELECTED_ID from '@salesforce/messageChannel/roomId__c';

import {publish,subscribe, MessageContext} from 'lightning/messageService';

import FILTER_CHANNEL from '@salesforce/messageChannel/roomFilters__c';


export default class HotelAppHomeRoomsTile extends LightningElement {

    roomList;
    roomId;

    roomFil

    @wire(MessageContext)
    messageContext;

      subscribeHandler(){
       this.roomIdSubscription =  subscribe(this.messageContext,SELECTED_ID,(message)=>this.handleSelectedId(message))
    }

    connectedCallback(){
    this.getRoomList()
    publish(this.messageContext, SELECTED_ID,  {roomId: this.roomId });
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
        console.log(this.roomId)
        this.sendIdEvent();

    }

    sendIdEvent(){

        publish(this.messageContext, SELECTED_ID,  {roomId: this.roomId });
        console.log('message dispatched',this.roomId)

    }

}