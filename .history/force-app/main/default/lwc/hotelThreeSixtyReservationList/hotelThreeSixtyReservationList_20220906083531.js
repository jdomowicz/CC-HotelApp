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
reservationIds = [];
selectedReservations = [];


   @api getReservationList(rooms) {

        this.resList = [];

        reservationList({rList:rooms }).then((result) => {

            this.reservationIds = [];

            this.resList = result;
            this.resevationSize = Object.keys(this.resList).length;
            this.reservationShow = this.resevationSize > 0 ? true : false;
            console.log(this.resList);

            result.forEach(element => {
                this.reservationIds.push(element.Id);
            });

            console.log('reservation Ids are: ',this.reservationIds);

            const selectedEvent = new CustomEvent('displayed',{detail: this.reservationIds});
            // Dispatches the event.
            this.dispatchEvent(selectedEvent);

        }).catch((error) => {
            console.error(error);
        })

    }

    getSelectedName(event) {
        this.selectedReservations = [];
        const selectedRows = event.detail.selectedRows;
        // Display that fieldName of the selected rows
        for (let i = 0; i < selectedRows.length; i++) {
            this.selectedReservations.push(selectedRows[i].Id);
        }
        console.log('selected Reservation are:', this.selectedReservations);

         const selectedEvent = new CustomEvent('displayed',{detail: this.reservationIds});
            // Dispatches the event.
            this.dispatchEvent(selectedEvent);
    }


}