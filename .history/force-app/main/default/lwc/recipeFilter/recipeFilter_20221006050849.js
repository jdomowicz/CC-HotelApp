import { LightningElement,wire } from 'lwc';
import geRandomRecipeString from '@salesforce/apex/Spoonacular.getRandomReceipeString';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import getRandomReceipeString from "@salesforce/apex/Spoonacular.getRandomString";
//import getRecipeByIngredients from "@salesforce/apex/Spoonacular.getRecipeByIngredients";

export default class RecipeFilter extends LightningElement {

queryTerm;
clickedButtonLabel;
error;

 Recipes {
		 vegetarian;
		 vegan;
		public Boolean glutenFree;
		public Boolean dairyFree;
		public Boolean veryHealthy;
		public Boolean cheap;
		public Boolean veryPopular;
		public Boolean sustainable;
		public Boolean lowFodmap;
		public Integer weightWatcherSmartPoints;
		public String gaps;
		public Integer preparationMinutes;
		public Integer cookingMinutes;
		public Integer aggregateLikes;
		public Integer healthScore;
		public String creditsText;
		public String sourceName;
		public Double pricePerServing;
		public Integer id;
		 String title;
		 Integer readyInMinutes;
		 Integer servings;
		public String sourceUrl;
		 String image;
		 String imageType;
		public String summary;
		public String instructions;
		public String spoonacularSourceUrl;
	}


handleText() {
        getRandomReceipeString()
            .then(result => {
                console.log(result);
            })
            .catch(error => {
                this.error = error;
            });
    }


    handleRandomRecipeString() {
        geRandomRecipeString()
            .then(result => {
                console.log('recipe results passed - start');
                console.log(result);
                console.log('recipe results passed - end');
            })
            .catch(error => {
                this.error = error;
            });
    }

    handleRandomRecipe() {
        geRandomRecipe()
            .then(result => {
                console.log('recipe results passed - start');
                console.log(result);
                console.log('recipe results passed - end');
            })
            .catch(error => {
                this.error = error;
            });
    }

    handleKeyUp(event) {
        const isEnterKey = event.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = event.target.value;
        }
    }


    handleClick(event) {
        this.handleText();
        this.handleRandomRecipeString();
        this.handleRandomRecipe();
    }


}