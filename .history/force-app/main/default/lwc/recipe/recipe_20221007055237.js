import { LightningElement } from 'lwc';
import getRecipeById from '@salesforce/apex/Spoonacular.getReceipe';

export default class Recipe extends LightningElement {

showTemplate = true;


     handleRandomRecipe() {
        getRecipeById()
            .then((data) => {
                console.log(data);
                this.recipedata = data;
                console.log(this.recipedata);

            })
            .catch(error => {
                console.error(error);
            });
    }

}