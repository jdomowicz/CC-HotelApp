import { LightningElement,api } from 'lwc';

export default class GetterSetter extends LightningElement {


   uppercaseItemName;

    @api
    get itemName() {
        return this.uppercaseItemName;
    }

    set itemName(value) {
       this.uppercaseItemName = value.toUpperCase();
    }

}