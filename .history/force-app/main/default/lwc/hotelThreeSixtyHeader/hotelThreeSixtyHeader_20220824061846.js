import { LightningElement } from 'lwc';
import hotelList from '@salesforce/apex/hotelController.hotelList';

export default class HotelThreeSixtyHeader extends LightningElement {

@wire(hotelList, { apexMethodParams })
propertyOrFunction;

}