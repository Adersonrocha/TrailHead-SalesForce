public class ContactAndLeadSearch {
    
    public static List<List<SObject>> searchContactsAndLeads(String entrada){
        List<List<sObject>> searchList = [FIND :entrada IN ALL FIELDS 
                                          RETURNING Contact(FirstName,LastName),
                                          Lead(FirstName,LastName)];
        Contact[] searchContacts = (Contact[])searchList[0];
        Lead[] searchLeads = (Lead[])searchList[1];
        System.debug('Found the following Contacts.');
        for (Contact a : searchContacts) {
            System.debug(a.LastName + ', ' + a.FirstName);
        }
        System.debug('Found the following Leads.');
        for (Lead c : searchLeads) {
            System.debug(c.LastName + ', ' + c.FirstName);
        }
       return searchList; 
    }
    
    
}