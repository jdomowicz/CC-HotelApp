import { LightningElement } from 'lwc';
import guestListfromReservation from '@salesforce/apex/guestController.guestListfromReservation';

export default class HotelThreeSixtyGuestList extends LightningElement {


    getGuestList() {

        guestListfromReservation({h: this.hotelValue }).then((result) => {
            this.roomList = result;
            this.roomListSize = Object.keys(this.roomList).length;
            this.roomShow = this.roomListSize > 0 ? true : false;
        }).catch((error) => {
            console.error(error);
        })
    }

}