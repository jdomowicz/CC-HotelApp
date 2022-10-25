import { LightningElement,wire } from 'lwc';
import ACCOUNT_LIST from '@salesforce/apex/AccountsWithContacts.accountList';
import ACCOUNT_DATA from '@salesforce/apex/AccountsWithContacts.accountData';
import ACCOUNT_WITH_CONTACT from '@salesforce/apex/AccountsWithContacts.accountWithContacts';

const columns = [
    { label: 'Id', fieldName: 'FirstName' },
    { label: 'Name', fieldName: 'LastName' }
];


export default class AccountDetailsTable extends LightningElement {

    accList = [];

    @wire(ACCOUNT_LIST) accList;

}
