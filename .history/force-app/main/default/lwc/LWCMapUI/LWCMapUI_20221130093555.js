import { LightningElement, api } from 'lwc';
import IUMapMarkerController from '@salesforce/apex/IUMapMarkerController.returnRecordsForUI';

export default class LWCMapUI extends LightningElement {

    @api objectApiName;

mapMarkers;

    getMarkers() {
        IUMapMarkerController({ objectType: this.objectApiName,uiType:'MapMarker' })
            .then((result) => {
                this.mapMarkers = result;
            })
            .catch((error) => {
                this.error = error;
                this.contacts = undefined;
            });
    }


}