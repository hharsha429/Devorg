import { LightningElement,wire } from 'lwc';
import getAcc from '@salesforce/apex/GetAccounts.getListAccounts';
import updateRecords from "@salesforce/apex/GetAccounts.updateRecords";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class DisplayAccounts extends LightningElement {
   selectedId;
   accounts;
   error;
   isShowModal=false;
   AccColumns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name', editable: true },
    { label: 'Phone', fieldName: 'Phone' , editable: true},
    { label: 'Industry', fieldName: 'Industry', editable: true }
];
    handlerAction(){
    
        getAcc()
		.then(result => {
			this.accounts = result;
			this.error = undefined;
		})
		.catch(error => {
			this.error = error;
			this.accounts = undefined;
		})
        this.isShowModal=true;
console.log('Accounts' +JSON.stringify(this.accounts));
    }
    hideModalBox() {  
        this.isShowModal = false;
    }
    handleRowSelection (event){
        var selectedRows=event.detail.selectedRows;
        console.log('selectedRows'+JSON.stringify(selectedRows));
        //console.log('selectedRows'+JSON.stringify(selectedRows[0].Id));
        /*if(selectedRows.length>1)
        {
            var el = this.template.querySelector('lightning-datatable');
            selectedRows=el.selectedRows=el.selectedRows.slice(1);
            this.showNotification();
            event.preventDefault();
            return;
        }*/
    }
    async updateSelectedRecords(event) {
        const draftValues = event.detail.draftValues;
        console.log('selected values'+JSON.stringify(draftValues));
        try {    
          await updateRecords({ recordsJson: JSON.stringify(draftValues) });
          this.showSuccessMessage();
          this.clearDraftValues();
          this.handlerAction();
        } catch (error) {

        }
      }

      showSuccessMessage() {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success",
            message: "Accounts were successfully updated",
            variant: "success"
          })
        );
      }

      clearDraftValues() {
        const datatable = this.template.querySelector("lightning-datatable");
        if (datatable) {
          datatable.draftValues = null;
        }
      }

}