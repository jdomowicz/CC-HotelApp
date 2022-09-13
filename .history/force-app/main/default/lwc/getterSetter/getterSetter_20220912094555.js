import { LightningElement,api } from 'lwc';

export default class GetterSetter extends LightningElement {

    number;

    handleChange(event){

        console.log(event.target.value);
        this.number = event.target.value;

    }
    set number(value){
         this.uppercaseItemName = value.toUpperCase();
    }

}