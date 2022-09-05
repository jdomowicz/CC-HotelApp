import { LightningElement,api,wire } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {


@api roomId = [];
resList;


    @api getReservationList() {
        reservationList({rList: 'a017Q00000lzxhrQAA' }).then((result) => {
            console.log(this.roomIds);
            console.log('reservationListTriggered');
            this.resList = result;
               console.log(this.resList);
        }).catch((error) => {
            console.error(error);
        })
    }


}