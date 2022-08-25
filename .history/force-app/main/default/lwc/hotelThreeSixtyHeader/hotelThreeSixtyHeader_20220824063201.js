import { LightningElement,wire } from 'lwc';
import hotelListDropdown from '@salesforce/apex/hotelController.hotelListDropdown';

export default class HotelThreeSixtyHeader extends LightningElement {

//create array for Hotel List results

hotelList = [];


 getHotelsList() {

        hotelListDropdown().then((result) => {

            this.hotelList = [];

            result.forEach(element => {
                this.hotelList = [...this.hotelList, { "label": element.Name, "value": element.Name, "Id": element.Id }];
            });
        console.log(this.hotelList);
        }).catch((error) => {
            console.error(error);
        })
    }
    //getter to pass Hotel List Options
    get hotelSelectOptions() {
        return this.hotelList;
    }
}