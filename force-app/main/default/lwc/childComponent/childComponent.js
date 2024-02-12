import { LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {

    increaseCount() {
        this.dispatchEvent(new CustomEvent('increasecount'));
    }
    
    decreaseCount() {
        this.dispatchEvent(new CustomEvent('decreasecount'));
    }

}