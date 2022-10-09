import { LightningElement,track } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import { refreshApex } from '@salesforce/apex';

export default class RecipeFilter extends LightningElement {

queryTerm;
error;
recipedata = [{}];

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
        this.handleRandomRecipe();
        //this.handler();
    }


}