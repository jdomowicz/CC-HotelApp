import { LightningElement } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

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


    selectedRoom()

}