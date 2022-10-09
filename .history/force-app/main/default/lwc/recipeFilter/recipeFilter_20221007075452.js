import { LightningElement } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';

export default class RecipeFilter extends LightningElement {

error;
recipedata = [];
time;
searchId ='';
showTemplate;


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
        this.showTemplate = false;
         this.template.querySelector('c-recipe').recipeSelected();
    }

    handleInputChange(event) {
            this.searchId = event.target.value;
            console.log(this.searchId);
    }

    connectedCallback(){
        console.log('connected callback parent');
    }


}