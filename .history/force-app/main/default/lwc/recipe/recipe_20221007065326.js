import { LightningElement } from 'lwc';
import getRecipeById from '@salesforce/apex/Spoonacular.getReceipe';

export default class Recipe extends LightningElement {

showTemplate = true;
recipeId ='';
recipedata;


     handleRecipe() {
        getRecipeById({ receipeId: this.recipeId })
            .then((data) => {
                console.log(data);
                this.recipedata = data;
                console.log(this.recipedata);

            })
            .catch(error => {
                console.error(error);
            });
    }

    fetchData(event){
        console.log('fetch recipe triggered');
        console.log(event.detail);
        console.log('public property passed to child ',this.recipeId);
    }

    connectedCallback(){
        console.log('child component rendered');

    }

}