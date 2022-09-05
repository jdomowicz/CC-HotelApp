import { LightningElement,api,wire } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {


@api roomId = ['a017Q00000m0nPaQAI';
resList;

/*
     getReservationList() {
        reservationList({h: this.getValueRoomIds }).then((result) => {
            this.resList = result;
               console.log(this.resList);
        }).catch((error) => {
            console.error(error);
        })
    }


    */
}