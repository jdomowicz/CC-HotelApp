import { LightningElement } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

export default class HotelAppHomeRoomsTile extends LightningElement {


    roomList;

    connectedCallback(){

    this.getRoomList()
    }

     getRoomList(){

        roomDisplayList().then((result)=>{

          console.log('getRoomList has been called');
            this.roomList = result;
            console.log(result);

        }).catch((error)=>{
            console.error(error);
        })

    }

}