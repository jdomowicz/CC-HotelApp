import { LightningElement } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

export default class HotelAppHomeRoomsTile extends LightningElement {


    roomList;

     getRoomList(){

        roomList().then((result)=>{

          this.roomList = [];
          console.log('getRoomList has been called');

          
           
        }).catch((error)=>{
            console.error(error);
        })

    }

}