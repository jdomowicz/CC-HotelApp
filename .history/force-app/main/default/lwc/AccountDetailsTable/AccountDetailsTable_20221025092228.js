import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountsWithContacts.accountList';
import ACCOUNT_DATA from '@salesforce/apex/AccountsWithContacts.accountData';
import getAccountWithContact from '@salesforce/apex/AccountsWithContacts.accountWithContacts';
import SystemModstamp from '@salesforce/schema/AcceptedEventRelation.SystemModstamp';

const columns = [

    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' }

]

const Contactcolumns = [

    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    { label: 'Account Id', fieldName: 'AccountId' }

]


export default class AccountDetailsTable extends LightningElement {

    accList = [];
    accListWithContact = [
        {}
    ];

    showDetailsValue = 0;

    columns = columns;
    Contactcolumns = Contactcolumns;

    selectedIds = [];

    loadAccountData() {
        getAccountList().then(result => {
            this.accList = result;

        })
            .catch(error => {
                this.error = error;
            });
    }

    connectedCallback() {
        this.loadAccountData();
    }

    // Load Account Data with Contact Info
    loadAccountWithContacts() {
        getAccountWithContact({ AccId: this.selectedIds }).then(result => {
            this.accListWithContact = result;
            this.ShowDetails(this.accListWithContact.length);
            console.log(this.showDetailsValue);


            for (let i = 0; i < this.accListWithContact.length; i++) {

                console.log('itterate over acc with contacts list')
                    console.log(this.accListWithContact[i].Contacts);
        }

        })
            .catch(error => {
                this.error = error;
            });
    }

    connectedCallback() {
        this.loadAccountData();
    }

    getSelectedContacts(event) {

        this.selectedIds = [];
        const selectedRows = event.detail.selectedRows;
        // Display that fieldName of the selected rows
        for (let i = 0; i < selectedRows.length; i++) {
            this.selectedIds = [...this.selectedIds, selectedRows[i].Id];
        }

        this.loadAccountWithContacts();


    }


    ShowDetails(data){
        if(data === 0){
            this.showDetailsValue = false;
        }
        else{

            this.showDetailsValue = true;
        }

    }
}