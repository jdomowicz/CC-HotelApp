import { LightningElement,api } from 'lwc';
import getRecipeById from '@salesforce/apex/Spoonacular.getReceipe';

export default class Recipe extends LightningElement {

showTemplate = true;
@api itemName;
recipedata;



     handleRecipe() {
        getRecipeById({ receipeId: this.itemName })
            .then((data) => {
                console.log(data);
                this.recipedata = data;
                console.log(this.recipedata);

            })
            .catch(error => {
                console.error(error);
            });
    }

    @api
    recipeSelected(){
       this.handleRecipe();
      


}