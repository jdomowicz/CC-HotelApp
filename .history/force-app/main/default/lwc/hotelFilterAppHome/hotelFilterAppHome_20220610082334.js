import { LightningElement,wire ,track} from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

import ROOM_TYPE_FIELD from '@salesforce/schema/Room__c.Type__c';
import ROOM_OBJECT from '@salesforce/schema/Room__c';

import countryList from '@salesforce/apex/hotelController.countryList';
import cityList from '@salesforce/apex/hotelController.cityList';
import hotelList from '@salesforce/apex/hotelController.hotelList';



export default class HotelFilterAppHome extends LightningElement {


    filters=[];

    accRecType;
    reservationDates=[];
    roomTypePicklist=[];
    numberofGuests;
    roomTypePicklistSelected = [];
    availableSelected


    @wire(getObjectInfo, { objectApiName: ROOM_OBJECT })
    roomData({data,error}){
        if(data){
            this.accRecType = data.defaultRecordTypeId;

        }
        if(error){
            console.error(error);
        }

    };

      @wire(getPicklistValues, { recordTypeId: '$accRecType', fieldApiName: ROOM_TYPE_FIELD })
        roomType({data,error}){
            if(data){
                data.values.forEach(element=>{
                    this.roomTypePicklist = [...this.roomTypePicklist,{label:element.label,value:element.value}];
                })

            }
            if(error){
                console.error(error)
            }
        };



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
            result.forEach(element => {

              this.cityList = [...this.cityList,{"label":element.City__c, "value":element.City__c}];
           });

        }).catch((error)=>{
            console.error(error);
        })

    }

    getHotelsList(){

        hotelList({countryName:this.countrySelectedValue , cityName:this.citySelectedValue}).then((result)=>{

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

        this.filters = [...this.filters,country=event.target.value];
        console.log(this.filters)





    }
    handleCityChange(event){

        this.citySelectedValue = event.target.value;
        this.getHotelsList();
        console.log(this.filters)
    }

    handleHotelChange(event){

        this.hotelSelectedValue = event.target.value;
    }



    handleDateChange(event){

        console.log(event.target.value);
        console.log(event.target.dataset.nm)
        this.reservationDates = [...this.reservationDates,{label:event.target.dataset.nm,value:event.target.value}];

        console.log(this.filters)

    }

    handlerGuestNumber(event){
        this.numberofGuests = event.target.value;

        console.log(this.filters)
    }

    handleTypeChange(event){

        this.roomTypePicklistSelected = [...this.roomTypePicklistSelected,{label:event.target.dataset.id,value:event.target.checked}];

        console.log(this.filters)

    }

    handleAvailableChange(event){

        this.availableSelected = event.target.checked;

        console.log(this.filters)
    }


}