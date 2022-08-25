import { LightningElement } from 'lwc';
import roomList from '@salesforce/apex/roomController.roomList';

const dataColumns = [
    {label:'Name',fieldName:'Name'},
    {label:'Id',fieldName:'Id'}
];

export default class HotelThreeSixtyRoomList extends LightningElement {

    roomList ;
    dataColumns = dataColumns;

}