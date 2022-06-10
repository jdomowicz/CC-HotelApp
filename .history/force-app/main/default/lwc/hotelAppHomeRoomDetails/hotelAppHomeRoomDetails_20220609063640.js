import { LightningElement,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Room__c.Name',
    'Room__c.Available__c',
    'Room__c.Hotel__c',
    'Room__c.Mini_Bar__c',
    'Room__c.photo_url__c',
    'Room__c.Room_Number__c',
    'Room__c.Type__c',
    'Room__c.tv__c'
    ];

export default class HotelAppHomeRoomDetails extends LightningElement {


    recordId = 'a017Q00000lzxhrQAA';
    room;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    rooomData({data,error}){
        if(data){

                 console.log(data)
                 this.room = [...{Name:data.Name.value,
                
                    Available__c:data.Available__c.value,
                    Mini_Bar__c:data.Mini_Bar__c.value,
                    ,
                    Mini_Bar__c:data.Mini_Bar__c.value
                
                }


                ]


           // this.room = data.fields;
          //  console.log(data.fields);
        }
        if(error){
            console.error(error);
        }
    }

}