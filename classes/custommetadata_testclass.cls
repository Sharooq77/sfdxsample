@istest
public class custommetadata_testclass {
 
     @isTest
    static void testApplyDiscount() {
        Discount_Rules__mdt rule = new Discount_Rules__mdt(
            Rule_Name__c = 'Test Rule',
            Discount_Percentage__c = 10,
            Customer_Segment__c = label.eletronics_lebel,
            Product_Category__c = 'mobile',
            Product_Validity__c = System.today()
        ); 

 
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            Customer_Segment__c = 'eletronics',
            Product_Category__c = 'mobile',
            CloseDate = Date.today(),
            StageName = 'Closed Won'
        );
        insert opp;
 
        // Test applying discount
        Test.startTest();
        discountclass.applyDiscount(opp.Customer_Segment__c, opp.Product_Category__c);
        Test.stopTest();
 
        // Add assertions as needed
    }
}