import { LightningElement } from 'lwc';

export default class GetterSetter extends LightningElement {

    number;

    handleChange(event){

        console.log('test data');

       // this.number = event.target.value;

    }

}