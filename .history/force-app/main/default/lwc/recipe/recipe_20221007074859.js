import { LightningElement,api } from 'lwc';
import getRecipeById from '@salesforce/apex/Spoonacular.getReceipe';

export default class Recipe extends LightningElement {

showTemplate;
@api itemName;
recipedata = [];



     handleRecipe() {
        getRecipeById({ receipeId: this.itemName })
            .then((data) => {
                console.log(data);
                this.recipedata = data;
                showTemplate = true;

            })
            .catch(error => {
                console.error(error);
                showTemplate = true;
            });
    }

    @api
    recipeSelected(){
       this.handleRecipe();
    }


}