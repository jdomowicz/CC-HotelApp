import { LightningElement } from 'lwc';

export default class GetterSetter extends LightningElement {

    number;

    handleChange(event){

        console.log(event.target.value);
        this.number = event.target.value;

    }

    set 

}