import { LightningElement } from 'lwc';

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

    handleCountryChange(event){

        this.countrySelectedValue = event.target.value;
    }


}