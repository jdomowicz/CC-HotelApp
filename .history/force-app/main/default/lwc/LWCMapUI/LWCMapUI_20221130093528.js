import { LightningElement, api } from 'lwc';
import IUMapMarkerController from '@salesforce/apex/IUMapMarkerController.returnRecordsForUI';

export default class LWCMapUI extends LightningElement {

    @api objectApiName;

mapMarkers;

    getMarkers() {
        IUMapMarkerController({ objectType: this.objectApiName,uiType: })
            .then((result) => {
                this.contacts = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.contacts = undefined;
            });
    }


}