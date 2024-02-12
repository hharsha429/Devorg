import { LightningElement ,wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { CurrentPageReference } from 'lightning/navigation';
export default class MyFirstComponent extends NavigationMixin(LightningElement) {

   // @api recordId;
    // Navigate to New Account Page
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
                defaultFieldValues: `AccountId=${this.pageRef.attributes.recordId},LastName=${this.pageRef.attributes.Name}`
            }
        });
    }

}