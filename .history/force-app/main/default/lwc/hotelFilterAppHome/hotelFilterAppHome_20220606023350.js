import { LightningElement } from 'lwc';

export default class HotelFilterAppHome extends LightningElement {

    get countrySelectOptions() {
        return [
            { label: "US", value: "US" },
            { label: "Poland", value: "Poland" }
        ];
    }

    countrySelectedValue = 'US';

    handleCountryChange(event){

        console.log(event.target.value)

        this.countrySelectedValue = event.target.value;
    }


}