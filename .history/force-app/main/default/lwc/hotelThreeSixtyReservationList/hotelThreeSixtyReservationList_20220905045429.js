import { LightningElement,api,wire } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {


@api roomIds =[];
resList;


     getReservationList() {
        reservationList({reservationList: this.roomIds }).then((result) => {
            this.resList = result;
               console.log(this.resList);
        }).catch((error) => {
            console.error(error);
        })
    }


    *
}