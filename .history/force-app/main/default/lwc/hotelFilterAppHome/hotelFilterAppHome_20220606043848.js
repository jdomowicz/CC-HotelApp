import { LightningElement,wire } from 'lwc';
import countryList from '@salesforce/apex/HotelController.countryList';
import cityList from '@salesforce/apex/HotelController.cityList';
import cityListWithArguments from '@salesforce/apex/HotelController.cityListWithArguments';

export default class HotelFilterAppHome extends LightningElement {

    //Default Values
    countrySelectedValue;
    citySelectedValue;

    // Populate with APEX Data
    countryList= [];
    citySelectList = [];
    cityFilteredList;

    @wire(countryList)
    countryListfromApex({data,error}){
        if(data){

            data.forEach(element => {

                this.countryList = [...this.countryList,{"label":element.Country__c, "value":element.Country__c}];
            });

        }
        if(error){
            console.error(error);
        }
    }

    @wire(cityList)
    cityListfromApex({data,error}){
        if(data){

            data.forEach(element => {
                this.citySelectList = [...this.citySelectList,{"label":element.City__c, "value":element.City__c}];
            });
        }
        if(error){
            console.error(error);
        }
    }


    getCityList(){

        cityListWithArguments({countryName:this.countrySelectedValue}).then((result)=>{

            console.log(result)

           


            console.log(this.cityFilteredList);



        })

        this.cityFilteredList =  this.citySelectList.filter(word => {

                console.log(result.City__c)

                    return word.value === 'Bilgoraj';
                })
    }



    get countrySelectOptions() {
        return this.countryList;
    }

        get citySelectOptions() {
        return this.citySelectList;
    }

    handleCountryChange(event){

        this.countrySelectedValue = event.target.value;
        this.getCityList();

    }

        handleCityChange(event){

        this.citySelectedValue = event.target.value;
        console.log(this.citySelectedValue);
    }


}