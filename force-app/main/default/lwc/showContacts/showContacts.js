import { LightningElement , api,wire} from 'lwc';
import getRecords from "@salesforce/apex/GetAccounts.getContacts";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin , CurrentPageReference} from 'lightning/navigation';
import updateconRecords from "@salesforce/apex/GetAccounts.updateConRecords";


export default class ShowContacts extends NavigationMixin(LightningElement) {
    selectedId;
    @api recordId;
    contactRecord;
    contactId;
    showDiv ;
    contacts;
    hasContacts=true;
    error;
    isShowModal=false;
    AccColumns = [
     { label: 'Name', fieldName: 'LastName', editable: true },
     { label: 'Phone', fieldName: 'Phone' , editable: true},
     { label: 'Email', fieldName: 'Email', editable: true }
 ];
 handlerAction(){
    
    getRecords({AccountId :this.recordId})
    .then(result => {
        this.contacts = result;
        if(this.contacts.length === 0){
            this.hasContacts=false;
        }
    })
    .catch(error => {
        this.error = error;

    })
    this.isShowModal=true;
    this.showDiv = false;
console.log('showDiv' +this.showDiv);
} 
hideModalBox() {  
    this.isShowModal = false;
}
@wire(CurrentPageReference) pageRef;

navigateToNewContactPage() {
    console.log('Record Id:', JSON.stringify(this.pageRef.attributes));
    this[NavigationMixin.Navigate]({
        type: 'standard__objectPage',
        attributes: {
            objectApiName: 'Contact',
            actionName: 'new'
        },
        state: {
            defaultFieldValues: `AccountId=${this.pageRef.attributes.recordId}`
        }
    });
    //this.showSuccessMessage();
}
showSuccessMessage() {
    this.dispatchEvent(
      new ShowToastEvent({
        title: "Success",
        message: "Contact updated successfully updated",
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
  async updateSelectedRecords(event) {
    const draftValues = event.detail.draftValues;
    console.log('selected values'+JSON.stringify(draftValues));
    try {    
      await updateconRecords({ recordsJson: JSON.stringify(draftValues) });
      this.showSuccessMessage();
      this.clearDraftValues();
      this.handlerAction();
    } catch (error) {

    }
  }
  handleRowSelection = event => {
    var selectedRows=event.detail.selectedRows;
    //this.contactRecord = selectedRows;
   selectedRows.forEach(con => {
   this.contactId = con.Id
});

this.showDiv = true;
console.log('this.contactId====>>>'+ this.showDiv);
}

gotoContactEditPage(){
    this.hideModalBox();
    const config = {
        type: "standard__recordPage",
        attributes: {
          recordId: this.contactId,
          objectApiName: "Contact",
          actionName: "edit"
        }
      };
      this[NavigationMixin.Navigate](config);
}

}