import { LightningElement,api } from 'lwc';
import getRecipeById from '@salesforce/apex/Spoonacular.getReceipe';

export default class Recipe extends LightningElement {

showTemplate = true;
@api recipeId;
recipedata;


     handleRecipe() {
        getRecipeById({ receipeId: this.recipeId })
            .then((data) => {
                console.log(data);
                this.recipedata = data;
                console.log(this.recipedata);

            })
            .catch(error => {
                console.error(error);
            });
    }

    fetchRecipe(){
        console.log('public property passed to child ',this.recipeId);
        this.handleRecipe();
        console.log(this.recipedata);
    }

}