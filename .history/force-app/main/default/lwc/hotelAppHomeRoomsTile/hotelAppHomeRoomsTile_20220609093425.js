import { LightningElement } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

import channelName from '@salesforce/messageChannel/channelReference';

export default class HotelAppHomeRoomsTile extends LightningElement {


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