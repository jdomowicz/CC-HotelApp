import { LightningElement,wire ,track} from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';

import ROOM_TYPE_FIELD from '@salesforce/schema/Room__c.Type__c';
import ROOM_OBJECT from '@salesforce/schema/Room__c';

import countryList from '@salesforce/apex/HotelController.countryList';
import cityList from '@salesforce/apex/HotelController.cityList';
import hotelList from '@salesforce/apex/HotelController.hotelList';



export default class HotelFilterAppHome extends LightningElement {


    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    propertyOrFunction;


    //Default Values
    countrySelectedValue = '';
    citySelectedValue = '';
    hotelSelectedValue = '';

    // Populate with APEX Data
    countryList= [];
    hotelList =[];
    cityList= [];

    // Fetch Data at load time
    connectedCallback(){
        this.getCityList();
        this.getHotelsList();
    }

    @wire(countryList)
    countryListfromApex({data,error}){
        if(data){

            console.log('countryListfromApex has been called');

            data.forEach(element => {
                this.countryList = [...this.countryList,{"label":element.Country__c, "value":element.Country__c}];
            });
        }
        if(error){
            console.error(error);
        }
    }

    getCityList(){

        cityList({countryName:this.countrySelectedValue}).then((result)=>{

          this.cityList = [];
          console.log('getCityList has been called');
            result.forEach(element => {

              this.cityList = [...this.cityList,{"label":element.City__c, "value":element.City__c}];
           });

        }).catch((error)=>{
            console.error(error);
        })

    }

    getHotelsList(){

        hotelList({countryName:this.countrySelectedValue , cityName:this.citySelectedValue}).then((result)=>{

            console.log('getHotelsList has been called');
            this.hotelList = [];

            result.forEach(element => {
              this.hotelList = [...this.hotelList,{"label":element.Name, "value":element.Name,"Id":element.Id}];
           });

        }).catch((error)=>{
            console.error(error);
        })

    }

    // Getters to pass Dropdown Options Data

    get countrySelectOptions() {
        return this.countryList;
    }

    get citySelectOptions() {
       return this.cityList;
    }

    get hotelSelectOptions() {
        return this.hotelList;
    }


    // Event Handlers
    handleCountryChange(event){

        this.countrySelectedValue = event.target.value;
        this.getCityList();
        this.getHotelsList();

    }
    handleCityChange(event){

        this.citySelectedValue = event.target.value;
        this.getHotelsList();
    }

    handleHotelChange(event){

        this.hotelSelectedValue = event.target.value;
    }


}