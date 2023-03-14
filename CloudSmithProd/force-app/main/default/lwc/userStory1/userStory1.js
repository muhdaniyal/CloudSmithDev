import { LightningElement } from 'lwc';

export default class UserStory1 extends LightningElement {}


function validateID() {
    const IDNumb = this.template.querySelector('[data-name="IDNumber"]');
    if (IDNum) {
      var ex = /^(((\d{2}((0[13578]|1[02])(0[1-9]|[12]\d|3[01])|(0[13456789]|1[012])(0[1-9]|[12]\d|30)|02(0[1-9]|1\d|2[0-8])))|([02468][048]|[13579][26])0229))(( |-)(\d{4})( |-)(\d{3})|(\d{7}))/;
    } else {
      // some other validation here
      var ex = /^[0-9]{1,}$/;
    }
    if (ex.test(IDNumb) == false) {
      // alert code goes here
      alert("Please supply a valid ID number");
      return false;
    }
    alert(IDNumb + " a valid ID number");
    // here you would normally obviously
    // return true;
    // but for the sake of this Codepen:
    return false;
  }