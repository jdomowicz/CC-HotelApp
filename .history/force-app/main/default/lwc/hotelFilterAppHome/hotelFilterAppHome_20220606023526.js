import { LightningElement } from 'lwc';

export default class HotelFilterAppHome extends LightningElement {

    get countrySelectOptions() {
        return [
            { label: "US", value: "US" },
            { label: "Poland", value: "Poland" }
        ];
    }

        get countrySelectOptions() {
        return [
            { label: "US", value: "US" },
            { label: "Poland", value: "Poland" }
        ];
    }

    countrySelectedValue = 'US';

    handleCountryChange(event){

        this.countrySelectedValue = event.target.value;
    }


}