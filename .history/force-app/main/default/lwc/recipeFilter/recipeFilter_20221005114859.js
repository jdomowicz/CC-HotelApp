import { LightningElement } from 'lwc';

export default class RecipeFilter extends LightningElement {

queryTerm;

    handleKeyUp(event) {
        const isEnterKey = event.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = evt.target.value;
        }
    }


}