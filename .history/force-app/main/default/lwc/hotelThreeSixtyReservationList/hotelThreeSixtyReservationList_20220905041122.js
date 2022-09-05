import { LightningElement,wire,api } from 'lwc';

export default class HotelThreeSixtyReservationList extends LightningElement {


handleEvent(event){
    console.log('event recived');
}

connectedCallback(){
    console.log('HotelThreeSixtyReservationList connected callbakc');
}

}