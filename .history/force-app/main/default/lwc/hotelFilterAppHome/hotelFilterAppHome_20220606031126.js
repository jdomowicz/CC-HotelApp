import { LightningElement } from 'lwc';
import countryList from '@salesforce/apex/HotelController.countryList';

export default class HotelFilterAppHome extends LightningElement {

    get countrySelectOptions() {
        return [
            { label: "US", value: "US" },
            { label: "Poland", value: "Poland" }
        ];
    }

        get citySelectOptions() {
        return [
            { label: "San Francisco", value: "San Francisco" },
            { label: "Wroclaw", value: "Wroclaw" }
        ];
    }

    countrySelectedValue = 'US';
    citySelectedValue;

    handleCountryChange(event){

        this.countrySelectedValue = event.target.value;
    }

        handleCityChange(event){

        this.citySelectedValue = event.target.value;
        console.log(this.citySelectedValue);
    }


}