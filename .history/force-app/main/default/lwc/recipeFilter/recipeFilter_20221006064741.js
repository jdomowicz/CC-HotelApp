import { LightningElement,track } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import getRandomString from '@salesforce/apex/Spoonacular.getRandomString';

export default class RecipeFilter extends LightningElement {

error;
recipedata = [];

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


    handleClick() {
        this.handleRandomRecipe();
        //this.handler();
    }

    handleSearch(){

    }


}