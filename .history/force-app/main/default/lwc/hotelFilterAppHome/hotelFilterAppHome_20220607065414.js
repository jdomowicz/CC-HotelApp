import { LightningElement,wire ,track} from 'lwc';
import countryList from '@salesforce/apex/HotelController.countryList';
import cityList from '@salesforce/apex/HotelController.cityList';
import hotelList from '@salesforce/apex/HotelController.hotelList';

export default class HotelFilterAppHome extends LightningElement {

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
        this.
    }

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

    handleCountryChange(event){

        this.countrySelectedValue = event.target.value;
        this.getCityList();

    }

    handleCityChange(event){

        this.citySelectedValue = event.target.value;
    }

    handleHotelChange(event){

        this.hotelSelectedValue = event.target.value;
    }


}