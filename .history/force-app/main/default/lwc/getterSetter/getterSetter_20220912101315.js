import { LightningElement,api } from 'lwc';

export default class GetterSetter extends LightningElement {


   uppercaseItemName;

    @api
    get itemName() {
        return this.uppercaseItemName;
    }

    set itemName(value) {
        console.log('set method is called')
     this.uppercaseItemName = value.toUpperCase();
    }

}