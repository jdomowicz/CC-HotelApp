import { LightningElement,api } from 'lwc';
import getRecipeById from '@salesforce/apex/Spoonacular.getReceipe';
import getReceipeByIngredients from '@salesforce/apex/Spoonacular.getReceipeByIngredients';


export default class Recipe extends LightningElement {

showTemplate = false;
@api itemName;
recipedata = [];
isnum;

checkIfNum(){
this.isnum = /^\d+$/.test(this.itemName);
}

recipeHandler(isnum){


}


//Handle recipe by Id
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

//Handle recipe by ingredients
         handleRecipebyIngr() {
        getReceipeByIngredients({ ingredients: this.itemName })
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
        console.log('search recipe is ',this.itemName);
        this.checkIfNum();
        console.log(this.isnum);
       this.handleRecipe();
    }


}