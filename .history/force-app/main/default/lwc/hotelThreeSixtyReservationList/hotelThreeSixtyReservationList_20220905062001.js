import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {

@api roomId;
dataColumns= dataColumns

resList = [];

   @api getReservationList(rooms) {

        this.resList = [];

        reservationList({rList:rooms }).then((result) => {
            this.resList = result;
            console.log(this.resList);

        }).catch((error) => {
            console.error(error);
        })
    }


}