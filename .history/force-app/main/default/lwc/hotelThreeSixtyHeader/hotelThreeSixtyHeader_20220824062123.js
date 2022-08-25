import { LightningElement } from 'lwc';
import hotelList from '@salesforce/apex/hotelController.hotelList';

export default class HotelThreeSixtyHeader extends LightningElement {

@wire(hotelList)
hotelListfromApex({ data, error }) {
        if (data) {

          this.hotelList = [];

            result.forEach(element => {
                this.hotelList = [...this.hotelList, { "label": element.Name, "value": element.Name, "Id": element.Id }];
            });

        }).catch((error) => {
            console.error(error);
        })

}