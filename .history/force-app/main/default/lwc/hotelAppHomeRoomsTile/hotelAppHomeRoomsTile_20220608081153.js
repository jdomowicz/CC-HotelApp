import { LightningElement } from 'lwc';
import roomDisplayList from '@salesforce/apex/roomController.roomDisplayList';

export default class HotelAppHomeRoomsTile extends LightningElement {


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

}