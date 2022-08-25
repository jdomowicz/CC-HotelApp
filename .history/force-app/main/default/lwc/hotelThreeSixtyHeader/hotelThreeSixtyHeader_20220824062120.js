import { LightningElement } from 'lwc';
import hotelList from '@salesforce/apex/hotelController.hotelList';

export default class HotelThreeSixtyHeader extends LightningElement {

@wire(hotelList)
hotelListfromApex({ data, error }) {
        if (data) {

            data.forEach(element => {
                this.countryList = [...this.countryList, { "label": element.Country__c, "value": element.Country__c }];
            });
        }
        if (error) {
            console.error(error);
        }
    }

}