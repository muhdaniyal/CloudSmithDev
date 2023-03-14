public class UsetStory4Controller {
    
    @AuraEnabled
    public static String callout( Integer year , String southAfricaID)
    {
        system.debug('this');
        // Define the API endpoint URL and required parameters
        List<Calendarific__mdt> calMetadata = Calendarific__mdt.getAll().values();
        String apiUrl = calMetadata[0].URL__c+'/holidays';
        String apiKey = calMetadata[0].Calendarific_API__c;
        String countryCode = 'ZA';
        
        Set<String> southAfricaIDs = new Set<String>();
        southAfricaIDs.add(southAfricaID);
        
        if(southAfricaIDs.size() > 0){
            UserStory3Controller.SA_IdentityNumber(southAfricaIDs);
        }
        
        // Create a new HTTP Request object
        HttpRequest req = new HttpRequest();
        
        // Set the HTTP Request parameters
        req.setEndpoint(apiUrl + '?api_key=' + apiKey + '&country=' + countryCode + '&year=' + year);
        req.setMethod('GET');
        
        // Create a new HTTP object to send the request
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        // Check the response status and retrieve the response body
        if (res.getStatusCode() == 200) {
            String responseJSON = res.getBody();
            system.debug('---'+responseJSON);
            return responseJSON;
            // Do something with the response data
            // 
        } else {
            System.debug('Error making API callout: ' + res.getStatus());
            return 'error';
        }
        
    }
    
}