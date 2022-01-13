public class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact c , String ue) {
        this.contact = c;
        this.state = ue;

    }

    public void execute(QueueableContext context){

        //Retrieve 200 Account records
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState =: state LIMIT 200];

        //create empty list of contact records
        List<Contact> contacts = new List<Contact>();
        //Iterate through the Account records

        for (Account acc : accounts) {
            //Clone the contact record, make the clone a child of the specific Account record
            //and add to  the list of contacts
            Contact conClone = contact.clone();
            conClone.AccountId = acc.Id;
            contacts.add(conClone);

        }
        insert contacts;
    }

}
