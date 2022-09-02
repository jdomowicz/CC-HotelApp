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
ratingURL;


// To pass scope, you must get a message context.
@wire(MessageContext)
    messageContext;

 gethotelListDropdown() {

        hotelListDropdown().then((result) => {
            this.hotelList = [];

            result.forEach(element => {
                this.hotelList = [...this.hotelList, { "label": element.Name, "value": element.Id, "Id": element.Id,"Rooms_Available__c":element.Rooms_Available__c,"Rating__c":element.Rating__c ,"RatingStar":element.Rating_Stars__c }];
            });
            this.hotelValue =  this.hotelList[0].Id;
            this.hotelRating = this.hotelList[0].Rating__c;
            this.handleRatingStar(this.hotelRating);

                    //Publish Message from Message Channel
            const hotelIdMessage = { hotelId: this.hotelValue};
            publish(this.messageContext, hotelId, hotelIdMessage);

        }).catch((error) => {
            console.error(error);
        })

    }

    getreturnHotelData() {

        returnHotelData({Hid:this.hotelValue}).then((result) => {

            this.hotelSelectedData = result;

        }).catch((error) => {
            console.error(error);
        })

    }

    handleRatingStar(ratingInput){
        switch(ratingInput){

                case '1':{
                    this.ratingURL = '/img/samples/stars_100.gif'
                }
                case '2':{
                    this.ratingURL = '/img/samples/stars_200.gif'
                }
                case '3':{
                    this.ratingURL = '/img/samples/stars_300.gif'
                }
                case '4':{
                    this.ratingURL = '/img/samples/stars_400.gif'
                }
                case '5':{
                    this.ratingURL = '/img/samples/stars_500.gif'
                    console.log('switch statement returned',this.ratingURL);
                }
            }
    }

    getreturnHotelData(){
        console.log(this.hotelValue,'value passed to get return hotel dat');
        returnHotelData({Hid : this.hotelValue} ).then((result) => {
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
    }

    //Handle Hotel Change
    hotelChange(event) {
        this.hotelValue = event.detail.value;

        //Publish Message from Message Channel
        const hotelIdMessage = { hotelId: this.hotelValue };
        publish(this.messageContext, hotelId, hotelIdMessage);

    }
}