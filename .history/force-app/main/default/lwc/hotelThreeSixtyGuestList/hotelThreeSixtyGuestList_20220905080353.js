import { LightningElement } from 'lwc';
import guestListfromReservation from '@salesforce/apex/guestController.guestListfromReservation';

const dataColumns = [
    {label:'Room Number',fieldName:'Room_Number__c'},
    {label:'Id',fieldName:'Id'},
    {label:'Name',fieldName:'Name'},
    {label:'Type',fieldName:'Type__c'},
    {label:'Max Number of Guests',fieldName:'Max_Number_of_Guests__c'},
    {label:'Available',fieldName:'Available__c'},
    {label:'Jacuzzi',fieldName:'Jacuzzi__c'}

];

export default class HotelThreeSixtyGuestList extends LightningElement {


    reservationList = ['a027Q000003GcKgQAK','a037Q000002GA9WQAW'];
    guestList;

    getGuestList() {
        guestListfromReservation({h: this.reservationList}).then((result) => {
            this.guestList = result;
        }).catch((error) => {
            console.error(error);
        })
    }

}