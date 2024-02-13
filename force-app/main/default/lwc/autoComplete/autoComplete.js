import { LightningElement } from 'lwc';
import getAcc from '@salesforce/apex/GetAccounts.getAcc';

export default class AutoComplete extends LightningElement {
     error;
        searching = false;
        options = [];
        inputValue = '';
        movieSelected;
    
        handleChangeAC(e){
            const key = e.target.value;
            this.inputValue = key;
    
            // CHECK IF THE USER IS SEARCHING
            if (key != '') {
            this.searching = true;
            getAcc({sName: this.inputValue})
            .then(result => {
                this.options = result;
            })
            .catch(error => {
                this.error = error;
        
            })
            }
            else{
                this.searching = false;
                this.options = this.options;
                return;
            }
    
            // FILTER VALUES
            //this.options = this.data.filter(element => element.label.toLowerCase().includes(key.toLowerCase()))
           // console.log('=====<>'+ this.options);
            //console.log('=====options<>'+ JSON.stringify(this.options));
            console.log('=====movieSelected<>'+ this.options.map(x => x.Id));
        }
    
        handleBlurAC(){
            // GIVE TIME TO THE USER TO SELECT THE OPTION
            setTimeout(() => {
                this.searching = false;
            }, 80);
        }
    
        handleClickOption(e){
            //alert('handle change called');
            //this.movieSelected = e.currentTarget.dataset.Id;
           // console.log('=====movieSelected<>'+ e.currentTarget.dataset.name);
            //console.log('=====movieSelected<>'+ this.movieSelected);
           // console.log('=====movieSelected<>'+ e.currentTarget.dataset.id);
            console.log('=====movieSelected<>'+ this.options.map());
            // POPULATE AND RESTORE INPUT VARIABLES
           //this.inputValue = this.options.find(element => element.Id == e.currentTarget.dataset.name).Name;
            //console.log('=====inputValue<>'+ this.inputValue);
            //this.searching = false;
        }
}