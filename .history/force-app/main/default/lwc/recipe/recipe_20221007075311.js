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
                this.showTemplate = true;

            })
            .catch(error => {
                console.error(error);
                this.showTemplate = false;
            });
    }

    @api
    recipeSelected(){
        console.log('search recipe is ');
       this.handleRecipe();
    }


}