import { LightningElement,api } from 'lwc';
import reservationList from '@salesforce/apex/ReservationController.reservationList';

const dataColumns = [
    {label:'Room Number',fieldName:'Room_Number__c'},
    {label:'Id',fieldName:'Id'},
    {label:'Name',fieldName:'Name'},
    {label:'Type',fieldName:'Type__c'},
    {label:'Max Number of Guests',fieldName:'Max_Number_of_Guests__c'},
    {label:'Available',fieldName:'Available__c'},
    {label:'Jacuzzi',fieldName:'Jacuzzi__c'}

];


export default class HotelThreeSixtyReservationList extends LightningElement {

@api roomId;
dataColumns= dataColumns;

resList = [];

   @api getReservationList(rooms) {

        this.resList = [];

        reservationList({rList:rooms }).then((result) => {
            this.resList = result;
            console.log(this.resList);

        }).catch((error) => {
            console.error(error);
        })
    }


}