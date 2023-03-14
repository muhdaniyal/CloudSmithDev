public class UserStory3Controller {
    public static void SA_IdentityNumber(Set<String> searchedKeywords){
        List<SA_Keyword__c> SAKeyList = new List<SA_Keyword__c>();
        SA_Keyword__c SAkeyObj;
        SET<STRING> SAKeyMatch = new SET<STRING>();
        for(SA_Keyword__c saKey :[select id ,name, SA_Keyword_Count__c ,SA_Search_Keyword__c
                                  FROM SA_Keyword__c
                                  WHERE SA_Search_Keyword__c IN: searchedKeywords])
        {
            saKey.SA_Keyword_Count__c = saKey.SA_Keyword_Count__c +1;
            SAKeyList.add(saKey);
            SAKeyMatch.add(saKey.SA_Search_Keyword__c);
        }
        for(String keyMatch : searchedKeywords){
            if(!SAKeyMatch.contains(keyMatch)){
                SAkeyObj = new SA_Keyword__c();
                SAkeyObj.SA_Search_Keyword__c = keyMatch;
                SAkeyObj.SA_Keyword_Count__c = 1;
                SAKeyList.add(SAkeyObj);
            }
        }
        
        if(SAKeyList.size()>0){
            database.upsert(SAKeyList,false);
        }
    }
    
}