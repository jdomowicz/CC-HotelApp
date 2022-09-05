import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';


export default class HotelThreeSixtyReservationList extends LightningElement {


@api roomId = [];

resList;

    @api getReservationList() {

        console.log('selected room Ids are:',['a017Q00000lzxhrQAA','a017Q00000lzxhsQAA']);

        reservationList({rList: this.roomId }).then((result) => {

            console.log('selected room Ids are:',this.roomId);

            this.resList = result;

        }).catch((error) => {
            console.error(error);
        })
    }


}