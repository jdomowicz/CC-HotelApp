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
reservationIds;


   @api getReservationList(rooms) {

        this.resList = [];

        reservationList({rList:rooms }).then((result) => {

            this.resList = result;
            this.resevationSize = Object.keys(this.resList).length;
            this.reservationShow = this.resevationSize > 0 ? true : false;
            console.log(this.resList);

            result.forEach(element => {
                this.reservationIds.add(element.Id);
            });


            console.log('
        console.log()');
            //this.reservationListEvent(this.resList);

          //  const selectedEvent = this.dispatchEvent(new CustomEvent('displayed',{detail:this.resList}));
            // Dispatches the event.
         //   this.dispatchEvent(selectedEvent);

        }).catch((error) => {
            console.error(error);
        })

    }

    // reservationListEvent(data) {

  //  }


}