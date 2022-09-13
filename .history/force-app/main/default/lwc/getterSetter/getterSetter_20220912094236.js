import { LightningElement } from 'lwc';

export default class GetterSetter extends LightningElement {

    number;

    handleChange(event){

        console.log(event.target.value);0

       // this.number = event.target.value;

    }

}