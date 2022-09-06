import { LightningElement,api } from 'lwc';
import guestListfromReservation from '@salesforce/apex/guestController.guestListfromReservation';

const dataColumns = [

    {label:'Id',fieldName:'Id'},
    {label:'Last Name',fieldName:'LastName'}

];

export default class HotelThreeSixtyGuestList extends LightningElement {

    dataColumns = dataColumns;
    reservationList = [];
    guestList = [];

   @api getGuestList(guestsIds) {
        guestListfromReservation({ids: guestsIds}).then((result) => {
            console.log('getGuestListTriggered');
            this.guestList = result;
        }).catch((error) => {
            console.error(error);
        })
    }

    connectedCallback(){

        /'this.getGuestList();

    }

}