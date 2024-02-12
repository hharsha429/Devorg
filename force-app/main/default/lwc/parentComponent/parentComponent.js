import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {

   Count=0;

    updateMessage(event) {
        this.Count++;
    }
    updateMessage1(event) {
        this.Count--;
    }
}