public class AccountHandler {
	
    public static void insertAccount(Integer num){
         Integer n= 0 ;
        List<Account> addAccounts = new List<Account>();
        
       
        while(n<num){
            Account a = new Account();
            a.Name = 'Acme Inc ' + n;
            a.AccountNumber = 'A000n' + n;
            addAccounts.add(a);
            System.debug(addAccounts);
            n++;
        }
        
        insert addAccounts;
    }
}