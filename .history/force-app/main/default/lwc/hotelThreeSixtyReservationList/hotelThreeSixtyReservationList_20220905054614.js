import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {


roomId;

resList;

    @api getReservationList() {
        

        console.log('selected room Ids are:',this.roomId);

        reservationList({rList:['a017Q00000lzxhrQAA','a017Q00000lzxhsQAA'] }).then((result) => {
            this.resList = result;
            console.log(this.resList);

        }).catch((error) => {
            console.error(error);
        })
    }


}