import { LightningElement,track } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';

export default class RecipeFilter extends LightningElement {

error;
recipedata = [];
@track time;

    handleRandomRecipe() {
        getRandomReceipe()
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