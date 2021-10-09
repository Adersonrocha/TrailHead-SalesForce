@IsTest
public class myDataGenerationTests {

    
   @testSetup
  static void loadTestMockDataFromStaticResource(){
    List<sObject> accounts = Test.loadData(Account.SObjectType, 'Mock_Data');
  } 
    
    @isTest
     static void testLoadAccountsFromStaticResource() {
    List<Account> accts = [SELECT ID FROM Account];
    system.assert(accts.size() == 15, 'expected 15 accounts');
         
        // for(Account a: accts){
         //    System.debug(a.Name);
        // }
  }
    
    @isTest
    static void testeLoadAccount(){
        List<Account> accts = [SELECT ID, Name FROM Account];
        
            
            System.assertEquals('Lehner-Bosco', accts[0].Name);
    
	}
    
}