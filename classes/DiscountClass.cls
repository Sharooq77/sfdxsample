public class DiscountClass {
    public static Decimal applyDiscount(String customerSegment, String productCategory) {
        Decimal discountPercentage = 0;

        // Query Custom Metadata for applicable rules
        List<Discount_Rules__mdt> rules = [SELECT Rule_Name__c, Discount_Percentage__c, Customer_Segment__c,
                                           Product_Category__c, Product_Validity__c
                                           FROM Discount_Rules__mdt 
                                           WHERE Customer_Segment__c = :customerSegment 
                                           AND Product_Category__c = :productCategory
                                           LIMIT 1];
        System.debug(rules);
           discountvalue__c document= discountvalue__c.getValues('demo1');
            discountvalue__c documents= discountvalue__c.getValues('demo2');

        // Apply discount based on rules
        for (Discount_Rules__mdt rule : rules) {
            discountPercentage += rule.Discount_Percentage__c;
        }
        System.debug(discountPercentage);
        return discountPercentage;
    }
}