import { LightningElement,wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountsWithContacts.accountList';
import ACCOUNT_DATA from '@salesforce/apex/AccountsWithContacts.accountData';
import ACCOUNT_WITH_CONTACT from '@salesforce/apex/AccountsWithContacts.accountWithContacts';

columns = [

    
]

export default class AccountDetailsTable extends LightningElement {

    accList = [];
    columns= columns;

    loadAccountData(){
        getAccountList().then(result=>{
            this.accList = result;
            console.log(result);
            })
                .catch(error => {
                    this.error = error;
                });
            }

            connectedCallback(){
                this.loadAccountData();
            }

}