import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {

@api roomId;

resList = [];

   @api getReservationList(rooms) {
        this.resList = [];
        console.log(rooms)

        reservationList({rList:rooms }).then((result) => {
            this.resList = result;
            console.log(this.resList);

        }).catch((error) => {
            console.error(error);
        })
    }


}