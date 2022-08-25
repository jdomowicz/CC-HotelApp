import { LightningElement,wire } from 'lwc';
import hotelListDropdown from '@salesforce/apex/hotelController.hotelListDropdown';


export default class HotelThreeSixtyHeader extends LightningElement {

//create array for Hotel List results

hotelList = [];
hotelValue;


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

     getRoomListDropdown() {

        roomList({h: this.hotelValue }).then((result) => {
            this.roomList = result;
        console.log(this.roomList.data);
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
        console.log(this.hotelValue);
        this.getRoomListDropdown();


    }
}