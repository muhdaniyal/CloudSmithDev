import { LightningElement, track } from 'lwc';
import saveValue from '@salesforce/apex/UserStory1Controller.saveValue';

export default class LwcInputForm extends LightningElement {
    @track value = '';

    handleChange(event) {
        this.value = event.target.value;
    }

    handleSave() {
        saveValue({ inputValue: this.value })
            .then(result => {
                console.log(result);
                // Do something with the result
            })
            .catch(error => {
                console.error(error);
                // Handle the error
            });
    }
}