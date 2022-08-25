import { LightningElement } from 'lwc';
import hotelList from '@salesforce/apex/hotelController.hotelList';

export default class HotelThreeSixtyHeader extends LightningElement {

//create array for Hotel List results

hotelList = [];


 getHotelsList() {

        hotelList().then((result) => {

            this.hotelList = [];

            result.forEach(element => {
                this.hotelList = [...this.hotelList, { "label": element.Name, "value": element.Name, "Id": element.Id }];
                console.log(this.hotelList);
            });

        }).catch((error) => {
            console.error(error);
        })

    }

    //getter to pass 
    get hotelSelectOptions() {
        return this.hotelList;
    }
}