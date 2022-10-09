import { LightningElement,track } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';

export default class RecipeFilter extends LightningElement {

error;
recipedata = [];

    handleRandomRecipe() {
        geRandomRecipe()
            .then((data) => {
                this.recipedata = data;

            })
            .catch(error => {
                console.error(error);
            });
    }


    handleClick() {
        this.handleRandomRecipe();
    }

    handleSearch(){
    }


}