import { LightningElement,track } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';

export default class RecipeFilter extends LightningElement {

error;
recipedata = [];
time;
searchId;


    handleRandomRecipe() {
        geRandomRecipe()
            .then((data) => {
                console.log(data);
                this.recipedata = data;
                console.log(this.recipedata);

            })
            .catch(error => {
                console.error(error);
            });
    }

    handleClick() {
        this.handleRandomRecipe();
    }

    handleSearch(){

        console.log(this.searchId);
        this.dispatchEvent(new CustomEvent('search'));
    }

    handleKeyUp(event) {
            this.searchId = event.target.value;
            console.log(this.searchId);
        
    }


}