public class UserStory2ControllersValidID {
//STring s = UserStory2ControllersValidID.validateAndDecode('9202204720082');//9202204720182
//system.debug(s);
    public static String validateAndDecode(String idNumber) {
        // Validate the ID number
        if (!isValid(idNumber)) {
            throw new InvalidIDNumberException('Invalid ID number: ' + idNumber);
        }
        Set<String> searchedKeywords = new Set<String>();
        String dateOfBirth = decodeDateOfBirth(idNumber);
        String gender = decodeGender(idNumber);
        String citizenship = decodeCitizenship(idNumber);
         
        String decodedInfo = 'Date of birth: ' + dateOfBirth + '\n'
                           + 'Gender: ' + gender + '\n'
                           + 'Citizenship: ' + citizenship;
        searchedKeywords.add(idNumber);
        UserStory3Controller.SA_IdentityNumber(searchedKeywords);
        return decodedInfo;
    }
    
    private static Boolean isValid(String idNumber) { 
         if (idNumber == null || idNumber.length() != 13) {
            return false;
         } else{
             return true;
         }  
    }
    
    private static String decodeDateOfBirth(String idNumber) {
        // Extract the date of birth from the ID number
        Integer year = Integer.valueOf(idNumber.substring(0, 2));
        Integer month = Integer.valueOf(idNumber.substring(2, 4));
        Integer day = Integer.valueOf(idNumber.substring(4, 6)); 
        Integer century = (year >= 0 && year <= 21) ? 2000 : 1900;
         
        Date dateOfBirth = Date.newInstance(century + year, month, day);
        return dateOfBirth.format();
    }
    
    private static String decodeGender(String idNumber) { 
        Integer genderDigit = Integer.valueOf(idNumber.substring(6, 7));
         
        String gender = (genderDigit < 5) ? 'Female' : 'Male';
        
        return gender;
    }
    
    private static String decodeCitizenship(String idNumber) { 
        Integer citizenshipDigit = Integer.valueOf(idNumber.substring(10, 11)); 
        String citizenship = (citizenshipDigit == 0) ? 'SA citizen' : 'Permanent resident';        
        return citizenship;
    }
    
    public class InvalidIDNumberException extends Exception { 
    }
}