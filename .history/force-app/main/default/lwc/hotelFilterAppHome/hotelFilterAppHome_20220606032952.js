import { LightningElement,wire } from 'lwc';
import countryList from '@salesforce/apex/HotelController.countryList';

export default class HotelFilterAppHome extends LightningElement {

    //Default Values
    countrySelectedValue;
    citySelectedValue;

    // Populate empt
    countryList= [];

    @wire(countryList)
    countryListfromApex({data,error}){
        if(data){

            data.forEach(element => {

                this.countryList = [...this.countryList,{"label":element.Country__c, "value":element.Country__c}];
            });

        }
        if(error){
            console.error(error);
        }
    }


    get countrySelectOptions() {
        return this.countryList;
    }

        get citySelectOptions() {
        return [
            { label: "San Francisco", value: "San Francisco" },
            { label: "Wroclaw", value: "Wroclaw" }
        ];
    }

    handleCountryChange(event){

        this.countrySelectedValue = event.target.value;
    }

        handleCityChange(event){

        this.citySelectedValue = event.target.value;
        console.log(this.citySelectedValue);
    }


}