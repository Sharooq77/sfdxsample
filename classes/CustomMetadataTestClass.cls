@isTest
public class CustomMetadataTestClass {
 
    @isTest
    static void testApplyDiscount() {
       
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            Customer_Segment__c = label.eletronics_lebel,
            Product_Category__c = 'mobile',
            CloseDate = Date.today(),
            StageName = 'Closed Won'
        );
        insert opp;

        System.runAs(new user(Id = UserInfo.getUserId())) {
            OpportunityTriggerHandler.applyDiscountPercentage(new List<Opportunity>{opp});


            List<Opportunity> rules = [SELECT Id, Discount_Percentage__c FROM Opportunity WHERE Id = :opp.Id];
            // Verify that the Discount_Percentage__c field is updated with the expected value
            Decimal expectedDiscount = 25;  // Assuming the discount is 25
            System.assertEquals(expectedDiscount, rules[0].Discount_Percentage__c, 'Comparing expected and actual results');
        }
    }
}