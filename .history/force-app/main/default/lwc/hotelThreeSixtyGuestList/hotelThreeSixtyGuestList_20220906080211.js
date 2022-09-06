import { LightningElement } from 'lwc';
import guestListfromReservation from '@salesforce/apex/guestController.guestListfromReservation';

const dataColumns = [

    {label:'Id',fieldName:'Id'},
    {label:'Last Name',fieldName:'LastName'}

];

export default class HotelThreeSixtyGuestList extends LightningElement {

    dataColumns = dataColumns;
    reservationList = [];
    guestList;

    getGuestList() {
        guestListfromReservation({ids: this.reservationList}).then((result) => {
            console.log('getGuestListTriggered');
            this.guestList = result;
        }).catch((error) => {
            console.error(error);
        })
    }

    connectedCallback(){

        this.getGuestList();

    }

}