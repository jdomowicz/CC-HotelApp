import { LightningElement,wire ,track} from 'lwc';
import countryList from '@salesforce/apex/HotelController.countryList';
import cityList from '@salesforce/apex/HotelController.cityList';
import cityListWithArguments from '@salesforce/apex/HotelController.cityListWithArguments';
import hotelListWithArguments from '@salesforce/apex/HotelController.hotelListWithArguments';

export default class HotelFilterAppHome extends LightningElement {

    //Default Values
    countrySelectedValue;
    citySelectedValue;
    isCountrySelected = 0;

    // Populate with APEX Data
    countryList= [];
    hotelsList =[];

    cityInitialList= [];
    cityFilteredList= [];

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
                this.cityInitialList = [...this.cityInitialList,{"label":element.City__c, "value":element.City__c}];
            });
        }
        if(error){
            console.error(error);
        }
    }

    getCityList(){

        cityListWithArguments({countryName:this.countrySelectedValue}).then((result)=>{

            this.cityFilteredList = [];
            this.isCountrySelected = 1

            console.log('apex loaded data is',result)
            result.forEach(element => {
              this.cityFilteredList = [...this.cityFilteredList,{"label":element.City__c, "value":element.City__c}];
           });

        }).catch((error)=>{
            console.error(error);
        })

    }

    getHotelsList(){

        hotelsList({countryName:this.countrySelectedValue , cityName:this.citySelectedValue}).then((result)=>{

            result.forEach(element => {
              this.hotelsList = [...this.hotelsList,{"label":element.Name, "value":element.Name,"Id":element.Id}];
           });

        }).catch((error)=>{
            console.error(error);
        })

    }

    get countrySelectOptions() {
        return this.countryList;
    }

        get citySelectOptions() {
        return this.isCountrySelected == 0 ?  this.cityInitialList :  this.cityFilteredList;
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