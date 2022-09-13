import { LightningElement } from 'lwc';

export default class GetterSetterParent extends LightningElement {

    text;

    handleChange(event){
        this.text = event.target.value;
        console.log();
    }
}