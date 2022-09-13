import { LightningElement } from 'lwc';

export default class GetterSetter extends LightningElement {

    number;

    handleChange(event){

        console.log()

        this.number = event.target.value;

    }

}