@isTest
public class CustomMetadataTestClass {
 
    @isTest
    static void testApplyDiscount() {
       
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            Customer_Segment__c = label.eletronics_lebel,
            Product_Category__c = 'Mobile',
            CloseDate = Date.today(),
            StageName = 'Closed Won'
        );
        insert opp;

        System.runAs(new user(Id = UserInfo.getUserId())) {
            OpportunityTriggerHandler.applyDiscountPercentage(new List<Opportunity>{opp});
            List<Opportunity> updatedOpps = [SELECT Id, Discount_Percentage__c, Description FROM Opportunity WHERE Id = :opp.Id];

            // Verify that the Discount_Percentage__c field is updated with the expected value
            Decimal expectedDiscount = 25.00;  // Assuming the discount is 25
            System.assertEquals(expectedDiscount.setScale(2), updatedOpps[0].Discount_Percentage__c.setScale(2), 'Comparing expected and actual discount percentage');

            // Verify the Description field
            System.assertEquals('20.0', String.valueOf(updatedOpps[0].Description), 'Comparing expected and actual Description');
        }
    }
}