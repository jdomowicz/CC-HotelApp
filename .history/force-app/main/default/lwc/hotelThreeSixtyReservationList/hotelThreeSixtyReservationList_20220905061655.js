import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {

@api roomId;

resList = [];

   @api getReservationList(rooms) {
        this.resList = [];
        console.log(this.roomId)

        reservationList({rList:this.roomId }).then((result) => {
            this.resList = result;
            console.log(this.resList);

        }).catch((error) => {
            console.error(error);
        })
    }


}