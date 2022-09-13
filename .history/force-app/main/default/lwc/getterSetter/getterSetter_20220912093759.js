import { LightningElement } from 'lwc';

export default class GetterSetter extends LightningElement {

    number;

    handleChange(event){

        console.log(event.target);

        this.number = event.target.value;

    }

}