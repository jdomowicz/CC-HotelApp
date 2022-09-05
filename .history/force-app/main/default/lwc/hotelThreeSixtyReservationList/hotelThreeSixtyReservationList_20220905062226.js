import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';

const dataColumns = [
    {label:'Id',fieldName:'Id'},
    {label:'Name',fieldName:'Name'}
];


export default class HotelThreeSixtyReservationList extends LightningElement {

@api roomId;
dataColumns= dataColumns;
resList = [];

   @api getReservationList(rooms) {

        this.resList = [];

        reservationList({rList:rooms }).then((result) => {

            this.roomListSize = Object.keys(this.roomList).length;
            this.roomShow = this.roomListSize > 0 ? true : false;
            
            this.resList = result;
            console.log(this.resList);

        }).catch((error) => {
            console.error(error);
        })
    }


}