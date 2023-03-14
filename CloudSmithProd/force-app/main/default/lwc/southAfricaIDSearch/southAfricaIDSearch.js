import { LightningElement, track } from 'lwc';
import holidayCheck from '@salesforce/apex/UserStory4Controller.callout';

export default class SouthAfricaIDSearch extends LightningElement {
    @track idNumber;
    @track errorMsg;
    @track isSearchDisabled = true;
    holidays = [];
    @track showTable = false;
  
    @track columns = [
        { label: 'Name', fieldName: 'name', sortable: true },
        { label: 'Date', fieldName: 'date', sortable: true },
        { label: 'Description', fieldName: 'description', sortable: true },
        { label: 'Country', fieldName: 'country', sortable: true },
    ];

    handleInputChange(event) {
        this.idNumber = event.target.value;
        this.isSearchDisabled = true;
        this.showTable = false;
        this.handleValidation();
    }
  
    handleValidation() {
        var regex = /^(((\d{2}((0[13578]|1[02])(0[1-9]|[12]\d|3[01])|(0[13456789]|1[012])(0[1-9]|[12]\d|30)|02(0[1-9]|1\d|2[0-8])))|([02468][048]|[13579][26])0229))(( |-)(\d{4})( |-)(\d{3})|(\d{7}))/;
          if (regex.test(this.idNumber)) {
            this.isSearchDisabled = false;
            this.errorMsg = '';
          }else {
            this.isSearchDisabled = true;
            this.errorMsg = 'Invalid South Africa ID Number';
        }
    }
  
    async handleSearch() {
        this.holidays = [];
        const dobYear = parseInt(this.idNumber.substring(0, 2));
        const currentYear = new Date().getFullYear();
        const century = currentYear - currentYear % 100;

        let yearOfBirth;
        if (dobYear >= currentYear % 100) {
            yearOfBirth = century - 100 + dobYear;
        } else {
            yearOfBirth = century + dobYear;
        }

        let tableData = [];
        // Handle the search button click here
        await holidayCheck({ year : parseInt(yearOfBirth) , southAfricaID : this.idNumber})
        .then(result => { 
                let data = JSON.parse(result);
                data.response.holidays.forEach(record => {
                // our object
                let holiday = {}; 

                holiday.Id = Math.random().toString(16).slice(2);
                holiday.name = record.name;
                holiday.date = record.date.iso;
                holiday.description = record.description;
                holiday.country = record.country.name;        
                // push the object to Array
                tableData.push(holiday);
            });
        })
        .catch(error => {
            this.errorMsg = error;
        });
        this.holidays = tableData;
        if(this.holidays.length > 0){
            this.showTable = true;
        }
    
        console.log('this.holidays>>>>   ', this.holidays);
    }
}