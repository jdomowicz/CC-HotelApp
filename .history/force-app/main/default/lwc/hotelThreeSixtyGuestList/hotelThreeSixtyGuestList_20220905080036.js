import { LightningElement } from 'lwc';
import guestListfromReservation from '@salesforce/apex/guestController.guestListfromReservation';

export default class HotelThreeSixtyGuestList extends LightningElement {


    reservationList = [];
    guestList;

    getGuestList() {

        guestListfromReservation({h: this.reservationList}).then((result) => {
            this.guestList = result;
        }).catch((error) => {
            console.error(error);
        })
    }

}