import { LightningElement } from 'lwc';

export default class HotelFilterAppHome extends LightningElement {

countrySelectOptions =[
    {label:"US", value:"US"},
    {label:"Poland", value:"Poland"}
    ]

    countrySelectedValue = 'US';

}