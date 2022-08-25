import { LightningElement } from 'lwc';
import roomList from '@salesforce/apex/roomController.roomList';
import recordSelected from '@salesforce/messageChannel/hotelId';

const dataColumns = [
    {label:'Name',fieldName:'Name'},
    {label:'Id',fieldName:'Id'}
];

export default class HotelThreeSixtyRoomList extends LightningElement {

    roomList ;
    dataColumns = dataColumns;
    hotelValue = 'a007Q00000AFc6GQAT';

     getRoomListDropdown() {

        roomList({h: this.hotelValue }).then((result) => {
            this.roomList = result;
        console.log(this.roomList.data);
        }).catch((error) => {
            console.error(error);
        })
    }

    connectedCallback(){
        this.getRoomListDropdown();

    }

}