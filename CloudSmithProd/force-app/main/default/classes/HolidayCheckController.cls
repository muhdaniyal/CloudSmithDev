public class HolidayCheckController {

    public String idNumber { get; set; }
    public Date dateOfBirth { get; set; }
    public List<String> holidays { get; set; }

    public void checkHolidays() {
        // Parse ID number to extract birthdate
        String birthdateString = '19' + idNumber.substring(0, 6);
        dateOfBirth = Date.valueOf(birthdateString);

        // Get public holidays on birthdate
        holidays = new List<String>();
        List<Public_Holiday__c> publicHolidays = [
            SELECT Name
            FROM Public_Holiday__c
            WHERE Date__c = :dateOfBirth
        ];
        for (Public_Holiday__c holiday : publicHolidays) {
            holidays.add(holiday.Name);
        }
    }
 /*
    public static Boolean isPublicHoliday(Date date) {
    // get the year, month and day of the date
    Integer year = date.year();
    Integer month = date.month();
    Integer day = date.day();
    
    // create a list of public holidays for the given year
    List<Date> publicHolidays = new List<Date>();
    publicHolidays.add(Date.newInstance(year, 1, 1));  // New Year's Day
    publicHolidays.add(Date.newInstance(year, 3, 21).addDays(-1 * (7 - (5 + year % 4) % 7)));  // Human Rights Day
    publicHolidays.add(Date.newInstance(year, 4, 27));  // Freedom Day
    publicHolidays.add(Date.newInstance(year, 5, 1));  // Workers' Day
    publicHolidays.add(Date.newInstance(year, 6, 16));  // Youth Day
    publicHolidays.add(Date.newInstance(year, 8, 9));  // National Women's Day
    publicHolidays.add(Date.newInstance(year, 9, 24));  // Heritage Day
    publicHolidays.add(Date.newInstance(year, 12, 16));  // Day of Reconciliation
    publicHolidays.add(Date.newInstance(year, 12, 25));  // Christmas Day
    publicHolidays.add(Date.newInstance(year, 12, 26));  // Day of Goodwill
    
    // check if the given date is a public holiday
    for (Date publicHoliday : publicHolidays) {
      if (publicHoliday == date) {
        return true;
      }
    }
    return false;
  }
  
    // method to get public holidays for a given date of birth
   public static List<Date> getPublicHolidays(String idNumber) {
        // extract the birth year, month and day from the ID number
        Integer year = Integer.valueOf(idNumber.substring(0, 2));
        Integer month = Integer.valueOf(idNumber.substring(2, 4));
        Integer day = Integer.valueOf(idNumber.substring(4, 6));
        if (month > 12) {
            year += 1900;
            month -= 12;
        } else {
            year += 2000;
        }
        
        // create a list of public holidays for the birth year
        List<Date> publicHolidays = new List<Date>();
        for (Integer i = 1; i <= 12; i++) {
            Date date = Date.newInstance(year, i, 1);
            if (isPublicHoliday(date)) {
                publicHolidays.add(date);
            }
        }
        Date date = Date.newInstance(year, 12, 25);
        if (isPublicHoliday(date)) {
            publicHolidays.add(date);
        }
        
        // get the public holidays for the birth day
        List<Date> birthPublicHolidays = new List<Date>();
        for (Date publicHoliday : publicHolidays) {
            if (publicHoliday.day() == day) {
                birthPublicHolidays.add(publicHoliday);
            }
        }
        
        return birthPublicHolidays;
    }*/
}