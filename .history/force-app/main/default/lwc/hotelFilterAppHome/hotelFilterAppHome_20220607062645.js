import { LightningElement,wire ,track} from 'lwc';
import countryList from '@salesforce/apex/HotelController.countryList';
import cityList from '@salesforce/apex/HotelController.cityList';
import hotelListWithArguments from '@salesforce/apex/HotelController.hotelListWithArguments';

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
        this. getCityList();
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

        hotelsList({countryName:this.countrySelectedValue , cityName:this.citySelectedValue}).then((result)=>{

            result.forEach(element => {
              this.hotelList = [...this.hotelList,{"label":element.Name, "value":element.Name,"Id":element.Id}];
           });

        }).catch((error)=>{
            console.error(error);
        })

    }

    get countrySelectOptions() {
        return this.countryList;
    }

    get citySelectOptions() {
        this.cityList;
    }

    get hotelSelectOptions() {
        return this.hotelList;
    }

    handleCountryChange(event){

        this.countrySelectedValue = event.target.value;
        this.getCityList();
       // this.getHotelsList();

    }

    handleCityChange(event){

        this.citySelectedValue = event.target.value;
        //this.getHotelsList();
    }

    handleHotelChange(event){

        this.hotelSelectedValue = event.target.value;
    }


}