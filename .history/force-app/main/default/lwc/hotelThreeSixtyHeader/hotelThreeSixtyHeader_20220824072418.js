import { LightningElement,wire } from 'lwc';
import hotelListDropdown from '@salesforce/apex/hotelController.hotelListDropdown';

export default class HotelThreeSixtyHeader extends LightningElement {

//create array for Hotel List results

hotelList = [];
hotelValue;
Id;
Rooms_Available__c;
hotelRoomsAvailable;

 gethotelListDropdown() {

        hotelListDropdown().then((result) => {
            this.hotelList = [];

            result.forEach(element => {
                this.hotelList = [...this.hotelList, { "label": element.Name, "value": element.Id, "Id": element.Id,"Rooms_Available__c":element.Rooms_Available__c,"Rating__c":element.Rating__c }];
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

    // Fetch Data at load time
    connectedCallback() {
        this.gethotelListDropdown();
    }

    //Handle Hotel Change
    hotelChange(event) {
        this.hotelValue = event.detail.value;
        this.hotelRoomsAvailable = event.detail.Rooms_Available__c;
        console.log(this.hotelValue);
        console.log(this.hotelRoomsAvailable);
    }
}