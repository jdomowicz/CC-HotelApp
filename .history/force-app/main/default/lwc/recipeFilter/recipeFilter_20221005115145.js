import { LightningElement } from 'lwc';

export default class RecipeFilter extends LightningElement {

queryTerm;

    handleKeyUp(event) {
        const isEnterKey = event.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = event.target.value;
        }
    }


    clickedButtonLabel;

    handleClick(event) {
        this.clickedButtonLabel = event.target.label;
    }


}