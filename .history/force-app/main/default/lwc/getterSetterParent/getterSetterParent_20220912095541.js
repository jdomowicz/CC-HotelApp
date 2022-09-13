import { LightningElement } from 'lwc';

export default class GetterSetterParent extends LightningElement {

    textName;

    handleChange(event){
        this.text = event.target.value;
        console.log(this.text);
    }
}