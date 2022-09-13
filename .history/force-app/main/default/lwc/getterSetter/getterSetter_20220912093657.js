import { LightningElement } from 'lwc';

export default class GetterSetter extends LightningElement {

    number;

    handleChange(event){

        this.number = event.target.value;

    }

}