import { LightningElement,track } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import getRandomString from '@salesforce/apex/Spoonacular.getRandomString';

export default class RecipeFilter extends LightningElement {

error;
recipedata = [];
@track time;

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

     handleDate() {
        getRandomString()
            .then((data) => {
                
                this.time = data;
                console.log(data);

            })
            .catch(error => {
                console.error(error);
            });
    }


    handleClick() {
        this.handleRandomRecipe();
        this.handleDate();
    }

    handleSearch(){

    }


}