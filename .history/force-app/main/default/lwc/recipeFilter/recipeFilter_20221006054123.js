import { LightningElement,wire } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import geRandomRecipeString from "@salesforce/apex/Spoonacular.getRandomReceipeString";

export default class RecipeFilter extends LightningElement {

queryTerm;
clickedButtonLabel;
error;
recipedata=[];


    handleRandomRecipe() {
        geRandomRecipe()
            .then((data) => {
                console.log(data);
            })
            .catch(error => {
                console.error(error);
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