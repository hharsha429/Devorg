import { LightningElement} from 'lwc';

export default class ParentToChild extends LightningElement {

count=0;
increaseCount(){
this.count++;

}
}