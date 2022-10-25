import { LightningElement,api } from 'lwc';

const Contactcolumns = [

    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' }

]


export default class ContactDetailsTable extends LightningElement {

    Contactcolumns = Contactcolumns;

     @api itemList;

     connectedCallback

}