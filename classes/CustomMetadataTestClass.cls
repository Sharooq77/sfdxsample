@isTest
public class CustomMetadataTestClass {

    @isTest
    static void testApplyDiscount() {
        // Input parameters (modify as needed)
        Decimal expectedDiscount = 25;

        // Create an Opportunity
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            Customer_Segment__c = label.eletronics_lebel,
            Product_Category__c = 'Mobile',
            CloseDate = Date.today(),
            StageName = 'Closed Won'
        );
        insert opp;

        // Run test as a specific user
        System.runAs(new User(Id = UserInfo.getUserId())) {
            // Call the method you want to test
            OpportunityTriggerHandler.applyDiscountPercentage(new List<Opportunity>{opp});

          
            
            List<Opportunity> updatedOpps = [SELECT Id, Discount_Percentage__c,Product_Category__c,Customer_Segment__c FROM Opportunity WHERE Id = :opp.Id];
			Decimal d=DiscountClass.applyDiscount( updatedOpps[0].Customer_Segment__c,updatedOpps[0].Product_Category__c);
            // Verify that the Discount_Percentage__c field is updated with the expected value
            System.debug('Expected Discount: ' + expectedDiscount);
            System.debug('Actual Discount: ' + updatedOpps[0].Discount_Percentage__c);
            System.assertEquals(expectedDiscount, d, 'Comparing expected and actual results');
        }
    }
}