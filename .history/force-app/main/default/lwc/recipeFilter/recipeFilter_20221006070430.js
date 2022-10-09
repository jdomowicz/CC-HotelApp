import { LightningElement } from 'lwc';
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

    handleKeyUp(evt) {
        const isEnterKey = evt.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = evt.target.value;
        }
    }

    handleClick() {
        this.handleRandomRecipe();
    }

    handleSearch(){
    }


}