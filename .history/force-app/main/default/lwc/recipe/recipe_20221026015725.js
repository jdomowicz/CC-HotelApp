import { LightningElement,api } from 'lwc';
import getRecipeById from '@salesforce/apex/Spoonacular.getReceipe';
import getReceipeByIngredients from '@salesforce/apex/Spoonacular.getReceipeByIngredients';


export default class Recipe extends LightningElement {

showTemplate = false;
@api itemName;
recipedata = [];
recipeItem;
isnum;

checkIfNum(){
this.isnum = /^\d+$/.test(this.itemName);
}

recipeHandler(){
    console.log('recipe hanlder triggered');

    if(this.isnum == true){
        this.handleRecipe();
        console.log('recipe by id triggered');
    }
    if(this.isnum == false){
     this.handleRecipebyIngr();
     console.log('recipe by ingredience triggered');
    }
    else{
        console.log('recipeHandlererror');
    }

}

//Handle recipe by Id
     handleRecipe() {
        getRecipeById({ receipeId: this.itemName })
            .then((data) => {
                console.log(data);
                this.recipeItem = data;
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
        this.checkIfNum();
        this.recipeHandler();
    }

}