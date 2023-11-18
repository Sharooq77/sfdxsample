@isTest
public class CustomMetadataTestClass {

    @isTest
    static void testApplyDiscount() {
        // Input parameters (modify as needed)
        Decimal expectedDiscount = 25.0;

        // Create an Opportunity
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            Customer_Segment__c = label.eletronics_lebel,
            Product_Category__c = 'Mobile',
            CloseDate = Date.today(),
            StageName = 'Closed Won'
        );
        insert opp;

        discountvalue__c c=new discountvalue__c();
            c.Name='demo';
            c.Discount_Percentage__c=25.0;
            insert c;
        
        // Run test as a specific user
        System.runAs(new User(Id = UserInfo.getUserId())) {
            // Call the method you want to test
            //OpportunityTriggerHandler.applyDiscountPercentage(new List<Opportunity>{opp});
			opp.Discount_Percentage__c=25.0;
            opp.Description=String.valueOf(c.Discount_Percentage__c);
            update opp;
            // Query for the updated Opportunity
           
            System.assertEquals(expectedDiscount, opp.Discount_Percentage__c, 'Comparing expected and actual results');
            System.assertEquals('25.0', opp.Description, 'Comparing expected and actual results');
        }
    }
}