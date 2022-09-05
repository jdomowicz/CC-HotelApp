import { LightningElement,api,wire } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {


@api roomId = [];
resList;


    @api  getReservationList() {
        reservationList({reservationList: this.roomIds }).then((result) => {
            console.log('reservationListTriggered');
            this.resList = result;
               console.log(this.resList);
        }).catch((error) => {
            console.error(error);
        })
    }


}