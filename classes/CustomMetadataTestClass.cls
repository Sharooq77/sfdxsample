@istest
public class CustomMetadataTestClass  {
 
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
       System.runAs (new user(Id=UserInfo.getUserId())) {
            // DiscountClass.applyDiscount(opp.Customer_Segment__c, opp.Product_Category__c);
           OpportunityTriggerHandler.applyDiscountPercentage(new List<Opportunity>{opp});
            List<Opportunity> rules = [SELECT Id, Discount_Percentage__c,Description FROM Opportunity WHERE Id = :opp.Id ];
        // Verify that the Days_Since_Opening__c field is updated with the expected value
        Decimal expectedDiscount = 25;  // Assuming the discount is 25
        System.assertEquals(expectedDiscount, rules[0].Discount_Percentage__c, 'Comparing expected and actual results');
         System.assertEquals('20.0', rules[0].Description, 'Comparing expected and actual results');
         
    }
}
}