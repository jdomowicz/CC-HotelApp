import { LightningElement } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
export default class RecipeFilter extends LightningElement {

queryTerm;
error;
@track recipedata;

    handleRandomRecipe() {
        geRandomRecipe()
            .then((data) => {
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
        this.recipedata = [];
        console.log(this.recipedata);
        console.log('button clicked');
        this.handleRandomRecipe();
        console.log(this.recipedata);
    }


}