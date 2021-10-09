@isTest	
public class MixedDMLFutureTest {

    @IsTest
    public static void test1(){
         Account a = new Account(Name='Acme');
        insert a;
        
        // This next operation (insert a user with a role) 
        // can't be mixed with the previous insert unless 
        // it is within a future method. 
        // Call future method to insert a user with a role.
      insertUserWithRole(
           'mruiasdz@awcomputing.com', 'miz', 
           'mruiasdasdz@awcomputing.com', 'Ruz');    
      User thisUser = [Select Id From User Where Id =: UserInfo.getUserId()];
       // System.runAs(thisUser){
        	Test.startTest();
        		
      		Test.stopTest(); 
      //  }
     
    }
      @future
    public static void insertUserWithRole(
        String uname, String al, String em, String lname) {

        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        // Create new user with a non-null user role ID 
        User u = new User(alias = al, email=em, 
            emailencodingkey='UTF-8', lastname=lname, 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username=uname);
        insert u;
    }
    
}