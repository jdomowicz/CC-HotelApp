import { LightningElement,wire } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import getRandomReceipeString from "@salesforce/apex/Spoonacular.getRandomString";
//import getRecipeByIngredients from "@salesforce/apex/Spoonacular.getRecipeByIngredients";

export default class RecipeFilter extends LightningElement {

queryTerm;
clickedButtonLabel;
error;


handleText() {
        getRandomReceipeString()
            .then(result => {
                console.log('recipe results passed - start');
                console.log(result);
                console.log('recipe results passed - end');
            })
            .catch(error => {
                this.error = error;
            });
    }


    handleRandomRecipe() {
        geRandomRecipe()
            .then(result => {
                console.log('recipe results passed - start');
                console.log(result);
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
        this.accessKey.getRandomReceipeString
    }


}