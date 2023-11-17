public without sharing class DiscountClass {

    public static Decimal applyDiscount(String customerSegment, String productCategory) {
        Decimal discountPercentage = 0;

        // Query Custom Metadata for applicable rules
        List<Discount_Rules__mdt> rules = [SELECT Rule_Name__c, Discount_Percentage__c, Customer_Segment__c,
                                           Product_Category__c, Product_Validity__c
                                           FROM Discount_Rules__mdt 
                                           WHERE Customer_Segment__c = :customerSegment 
                                           AND Product_Category__c = :productCategory];
        
        // Declare 'rule' outside of the loop
        Discount_Rules__mdt rule;

        // Assign the first rule to 'rule' if there are rules
        if (!rules.isEmpty()) {
            rule = rules[0];

            // Use 'rule' or perform other actions as needed
            discountPercentage += rule.Discount_Percentage__c;
        }

        // Query discount values for specific documents (not used in the current code)
         discountvalue__c document = discountvalue__c.getValues('demo1');

        return discountPercentage;
    }
}