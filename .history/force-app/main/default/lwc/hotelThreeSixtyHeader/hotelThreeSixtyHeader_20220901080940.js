import { LightningElement,wire } from 'lwc';
import hotelListDropdown from '@salesforce/apex/hotelController.hotelListDropdown';
import hotelId from '@salesforce/messageChannel/hotelId__c';

import {
    publish,
    MessageContext
} from 'lightning/messageService';


export default class HotelThreeSixtyHeader extends LightningElement {

//create array for Hotel List results

hotelList = [];
//hotelValue = 'a007Q00000AFc6GQAT';
hotelValue;
hotelId;

// To pass scope, you must get a message context.
@wire(MessageContext)
    messageContext;

 gethotelListDropdown() {

        hotelListDropdown().then((result) => {
            this.hotelList = [];

            result.forEach(element => {
                this.hotelList = [...this.hotelList, { "label": element.Name, "value": element.Id, "Id": element.Id,"Rooms_Available__c":element.Rooms_Available__c,"Rating__c":element.Rating__c }];
            });
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

        //Publish Message from Message Channel
        const hotelIdMessage = { hotelId: this.hotelValue };
        publish(this.messageContext, hotelId, hotelIdMessage);

    }
}