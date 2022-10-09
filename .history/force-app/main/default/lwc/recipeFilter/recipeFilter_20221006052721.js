import { LightningElement,wire } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import geRandomRecipeString from "@salesforce/apex/Spoonacular.getRandomReceipeString";

export default class RecipeFilter extends LightningElement {

queryTerm;
clickedButtonLabel;
error;
recipedata = [];

    handleRandomRecipeString() {
        geRandomRecipeString()
            .then(result => {
                console.log(result);
            })
            .catch(error => {
                this.error = error;
            });
    }

    handleRandomRecipe() {
        geRandomRecipe()
            .then(result => {
                console.log('recipe results passed - start');
                this.recipedata = result;
                console.log('test');
                console.log(this.recipedata);
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
        this.handleRandomRecipeString();
        this.handleRandomRecipe();
    }


}