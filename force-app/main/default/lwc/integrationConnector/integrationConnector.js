import { LightningElement } from 'lwc';
import getMetaDataRecords from '@salesforce/apex/IntegrationConnectorController.getMetaDataRecords';

export default class IntegrationConnector extends LightningElement {

    endPoint;
    type;
    requestJson;
    hasMetadata=false;
    mdtRec;
    accounts;

    countryOptions = [
        { label: 'GET', value: 'GET' },
        { label: 'PUT', value: 'PUT' },
        { label: 'POST', value: 'POST' },
        { label: 'PATCH', value: 'PATCH' },
    ];

    handleEndPointChange(event) {
        this.endPoint = event.target.value;
    }

    handleTypeChange(event) {
        this.type = event.target.value;
    }

    handleJsonChange(event) {
        this.requestJson = event.target.value;
    }
    handleChange(event) {
        this.hasMetadata = event.target.checked;
    }
    handleMdtChange(event) {
        this.mdtRec = event.target.value;
    }
    handleSubmit() {
        getMetaDataRecords({Name: this.mdtRec});
        console.log('endPoint:', this.endPoint);
        console.log('type:', this.type);
        console.log('requestJson:', this.requestJson);
        console.log('requemdtRecstJson:', this.mdtRec);
        // You can also call an Apex method to save the form data to Salesforce database
    }

}