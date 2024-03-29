import { LightningElement,wire,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {


@api getValueRoomIds;


     getreservationList() {

        roomList({h: this.hotelValue }).then((result) => {
            this.roomList = result;
            this.roomListSize = Object.keys(this.roomList).length;
            console.log('getRoomList --> Room List size = ', this.roomListSize);
            this.roomShow = this.roomListSize > 0 ? true : false;
        }).catch((error) => {
            console.error(error);
        })
    }


}