import { LightningElement,wire } from 'lwc';
import hotelListDropdown from '@salesforce/apex/hotelController.hotelListDropdown';
import returnHotelData from '@salesforce/apex/hotelController.returnHotelData';

import hotelId from '@salesforce/messageChannel/hotelId__c';

import {
    publish,
    MessageContext
} from 'lightning/messageService';

export default class HotelThreeSixtyHeader extends LightningElement {

//create array for Hotel List results

hotelList = [];
hotelValue;
hotelId;
hotelSelectedData;
hotelRating;


// To pass scope, you must get a message context.
@wire(MessageContext)
    messageContext;

 gethotelListDropdown() {

        hotelListDropdown().then((result) => {
            this.hotelList = [];

            result.forEach(element => {
                this.hotelList = [...this.hotelList, { "label": element.Name, "value": element.Id, "Id": element.Id,"Rooms_Available__c":element.Rooms_Available__c,"Rating__c":element.Rating__c }];
            });
            this.hotelValue =  this.hotelList[0].Id;
            console.log('hotel value = ',this.hotelValue);

                    //Publish Message from Message Channel
            const hotelIdMessage = { hotelId: this.hotelValue};
            publish(this.messageContext, hotelId, hotelIdMessage);

        }).catch((error) => {
            console.error(error);
        })

    }

    getreturnHotelData(){
        console.log(this.hotelValue,'value passed to get return hotel dat');
        returnHotelData({Hid : this.hotelValue ).then((result) => {
            this.hotelSelectedData = result;
            console.log(result);
        }
        ).catch((error) =>{
        console.log('promise error occured',error);
    })
}

    //getter to pass Hotel List Options
    get hotelSelectOptions() {
        return this.hotelList;
    }

    // Fetch Data at load time
    connectedCallback() {
        this.gethotelListDropdown();
        console.log('getlistdropdowncompleed');
        this.getreturnHotelData();
        console.log('return Hotel data completed');
    }

    //Handle Hotel Change
    hotelChange(event) {
        this.hotelValue = event.detail.value;

        //Publish Message from Message Channel
        const hotelIdMessage = { hotelId: this.hotelValue };
        publish(this.messageContext, hotelId, hotelIdMessage);

    }
}