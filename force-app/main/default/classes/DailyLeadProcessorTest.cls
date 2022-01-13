@IsTest
public without sharing class DailyLeadProcessorTest  {
   
 private static String CRON_EXP = '0 0 0 ? * * *';

    @isTest
    private static void testSchedulableClass(){
        List<Lead> leads = new List<Lead>();

        for (Integer i = 0; i <500;i++) {
            
            if(i<250){
                leads.add(new Lead(LastName = 'Connock', Company = 'Salesforce'));
            }else{
                leads.add(new Lead(LastName = 'Connock', Company = 'Salesforce', LeadSource = 'other'));
            }
           
        }
        insert leads;
    
        Test.startTest();
        Id jobId = System.schedule('Process Leads', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        List<Lead> updateLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource ='Dreamforce'];
        System.assertEquals(200,updateLeads.size(), 'ERROR: at least 1 record not update correctly');

        List<CronTrigger> cts = [SELECT id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id =: jobId];
        System.debug('Next Fire Time '+ cts[0].NextFireTime);
    }
}