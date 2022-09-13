import { LightningElement,api } from 'lwc';

export default class GetterSetter extends LightningElement {

    text;

    handleChange(event){

        console.log(event.target.value);
        this.number = event.target.value;

    }

    get number(){

        return this.number;

    }
    set number(value){
         this.number = value.toUpperCase();
    }

}