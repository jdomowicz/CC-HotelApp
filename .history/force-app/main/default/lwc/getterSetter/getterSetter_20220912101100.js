import { LightningElement,api } from 'lwc';

export default class GetterSetter extends LightningElement {


   uppercaseItemName;

    @api
    get itemName() {
        return this.uppercaseItemName;
    }

    set itemName(value) {
        console.log()
       this.uppercaseItemName = value.toUpperCase();
    }

}