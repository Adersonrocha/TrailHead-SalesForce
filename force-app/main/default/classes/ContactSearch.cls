public class ContactSearch {
		
    
    public static List<Contact> searchForContacts(String sobreNome, String cep){
        
        List<Contact> lists = [SELECT Id, Name FROM Contact WHERE 
                                Lastname =: sobreNome AND MailingPostalCode =: cep 
                                Limit 20];
        
        return lists;
    }
    
}