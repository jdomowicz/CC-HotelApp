import { LightningElement } from 'lwc';
import geRandom_R from '@salesforce/apex/Spoonacular.getRandomReceipe';

export default class RecipeFilter extends LightningElement {

queryTerm;
clickedButtonLabel;
recipe = [];


    handleRandomRecipe() {
        RANDOM_RECIPE()
            .then(result => {
                console.log('recipe results passed - start');
                console.log(result);
                this.recipe = result;
                console.log('recipe results passed - end');
            })
            .catch(error => {
                this.error = error;
            });
    }

    handleKeyUp(event) {
        const isEnterKey = event.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = event.target.value;
        }
    }


    handleClick(event) {
        this.handleRandomRecipe();
    }


}