import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';

const dataColumns = [
    {label:'Id',fieldName:'Id'},
    {label:'Name',fieldName:'Name'}
];


export default class HotelThreeSixtyReservationList extends LightningElement {

@api roomId;
dataColumns= dataColumns;
@api resList = [];
resevationSize;
reservationShow;
reservationIds;


   @api getReservationList(rooms) {

        this.resList = [];

        reservationList({rList:rooms }).then((result) => {

            this.resList = result;
            this.resevationSize = Object.keys(this.resList).length;
            this.reservationShow = this.resevationSize > 0 ? true : false;

            // Creates the event with the contact ID data.
            const selectedEvent = new CustomEvent('selected', { detail: this.contact.Id });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);

        }).catch((error) => {
            console.error(error);
        })




    }


}