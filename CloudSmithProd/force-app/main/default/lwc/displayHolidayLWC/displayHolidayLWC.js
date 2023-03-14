import { LightningElement, wire } from 'lwc';
import getHolidays from '@salesforce/apex/UserStory4Controller.callout';

const columns = [
    { label: 'Name', fieldName: 'name', type: 'text' },
    { label: 'Description', fieldName: 'description', type: 'text' },
    { label: 'Country', fieldName: 'country.name', type: 'text' },
    { label: 'Date', fieldName: 'date.iso', type: 'date' },
    { label: 'Type', fieldName: 'primary_type', type: 'text' }
]; 
export default class DisplayHolidayLWC extends LightningElement {
    holidays = [];

    @wire(getHolidays)
    wiredHolidays({error, data}) {
        if (data) {
            this.holidays = data.response.holidays;
            console.log(this.holidays);
        } else if (error) {
            console.log('Error retrieving holidays:', error);
        }
    }
}