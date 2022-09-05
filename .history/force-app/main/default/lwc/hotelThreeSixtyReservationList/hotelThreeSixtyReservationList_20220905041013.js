import { LightningElement,wire,api } from 'lwc';

export default class HotelThreeSixtyReservationList extends LightningElement {


handleEvent(){
    console.log('event recived');
}

connectedCallback(){
    console.log('HotelThreeSixtyReservationList' connected callbakc)
}

}