public class UserStory1Controller {
    @AuraEnabled
    public static void saveValue(String inputValue) {
        // Do something with the input value, e.g. save to a record
        system.debug('----'+inputValue);
    }
    
}