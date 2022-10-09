import { LightningElement,track } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import geRandomRecipeString from '@salesforce/apex/Spoonacular.getRandomReceipeString';
import { refreshApex } from '@salesforce/apex';

export default class RecipeFilter extends LightningElement {

queryTerm;
error;
recipedata;

    // Update the record using updateRecord(recordInput)
// Refresh Apex data that the wire service provisioned
    handler() {
        geRandomRecipe().then((data) => {
        refreshApex(this.recipedata);
    });
    }


    handleRandomRecipe() {
        geRandomRecipe()
            .then((data) => {
                this.recipedata = [];
                this.recipedata = data;
                console.log(this.recipedata);

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

    handleClick() {
        this.handleRandomRecipe();
        this.handler();
    }


}