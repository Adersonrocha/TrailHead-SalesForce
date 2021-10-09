@RestResource(urlMapping='/Account/*')
global class MyRestResource {

    @HttpGet
    global static List<Account> Record(){
        List<Account> listAccount = [Select Id, Name from Account];
        
        
        
        return listAccount;
    }
    
}