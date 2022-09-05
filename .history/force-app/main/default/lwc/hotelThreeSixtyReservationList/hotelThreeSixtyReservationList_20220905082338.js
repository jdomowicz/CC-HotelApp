import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';

const dataColumns = [
    {label:'Id',fieldName:'Id'},
    {label:'Name',fieldName:'Name'}
];


export default class HotelThreeSixtyReservationList extends LightningElement {

@api roomId;
dataColumns= dataColumns;
@api resList = [];
resevationSize;
reservationShow;

   @api getReservationList(rooms) {

        this.resList = [];
        

        reservationList({rList:rooms }).then((result) => {

            this.resList = result;
            this.resevationSize = Object.keys(this.resList).length;
            this.reservationShow = this.resevationSize > 0 ? true : false;
            console.log(this.resList);
            this.dispatchEvent(new CustomEvent('reservationclick',{detail: this.resList}))


        }).catch((error) => {
            console.error(error);
        })

    }


}