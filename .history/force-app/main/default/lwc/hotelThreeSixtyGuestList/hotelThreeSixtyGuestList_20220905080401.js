import { LightningElement } from 'lwc';
import guestListfromReservation from '@salesforce/apex/guestController.guestListfromReservation';

const dataColumns = [

    {label:'Id',fieldName:'Id'},
    {label:'Name',fieldName:'Name'}

];

export default class HotelThreeSixtyGuestList extends LightningElement {


    reservationList = ['a027Q000003GcKgQAK','a037Q000002GA9WQAW'];
    guestList;

    getGuestList() {
        guestListfromReservation({h: this.reservationList}).then((result) => {
            this.guestList = result;
        }).catch((error) => {
            console.error(error);
        })
    }

}