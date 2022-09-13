import { LightningElement } from 'lwc';

export default class GetterSetterParent extends LightningElement {

    textName = '';

    handleChange(event){
        this.textName = event.target.value;
        console.log(this.textName);
    }
}