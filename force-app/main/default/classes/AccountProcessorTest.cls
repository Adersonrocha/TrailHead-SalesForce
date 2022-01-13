@IsTest
public class AccountProcessorTest {
   
 
    @IsTest
    private static void countContacts(){

        // Load Test Data
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<100; i++){
            accounts.add(new Account(Name='Test Account' + i));
        }
        insert accounts;
    

        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        for (Account acc : accounts) {
            contacts.add(new Contact(FirstName=acc.Name, LastName='TestContact', AccountId=acc.Id));
            accountIds.add(acc.Id);
        }
        insert contacts;

        Test.startTest();

        AccountProcessor.countContacts(accountIds);

        Test.stopTest();


        List<Account> accs = [SELECT Id, Number_Of_Contacts__c FROM Account];
        for(Account acc: accs){
            System.assertEquals(1, acc.Number_Of_Contacts__c, 'Error: At least 1 Account record incorrect contacts');
        }



    }



}