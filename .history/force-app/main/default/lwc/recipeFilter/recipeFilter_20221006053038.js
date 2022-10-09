import { LightningElement,wire } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import geRandomRecipeString from "@salesforce/apex/Spoonacular.getRandomReceipeString";

export default class RecipeFilter extends LightningElement {

queryTerm;
clickedButtonLabel;
error;
recipedata = [];

    handleRandomRecipeString() {
        geRandomRecipeString()
            .then(result => {
                console.log(result);
            })
            .catch(error => {
                this.error = error;
            });
    }

     getRandomRecipe()
      .then((data) => {
        this.recipes =
          JSON.parse(data) && JSON.parse(data).recipes
            ? JSON.parse(data).recipes
            : [];
      })
      .catch((error) => {
        console.error(error);
      });
  }

    handleRandomRecipe() {
        geRandomRecipe()
            .then((data) => {
                console.log('recipe results passed - start');
                this.recipedata = data;
                console.log('recipe data assigned');
                console.log(data);
                console.log('recipe results passed - end');
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


    handleClick(event) {
        this.handleRandomRecipeString();
        this.handleRandomRecipe();
    }


}