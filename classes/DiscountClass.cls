/**
 * @description The DiscountClass class provides methods for applying discounts based on custom metadata rules.
 */
public without sharing class DiscountClass {

    /**
     * @description Applies a discount based on custom metadata rules.
     *
     * @param customerSegment The customer segment for which the discount is being applied.
     * @param productCategory The product category for which the discount is being applied.
     * @return The calculated discount percentage.
     */
    public static Decimal applyDiscount(String customerSegment, String productCategory) {
        Decimal discountPercentage = 0;

        if (!Schema.SObjectType.Discount_Rules__mdt.isAccessible()) {
            return discountPercentage;
        }

        // Query Custom Metadata for applicable rules
        List<Discount_Rules__mdt> rules = [SELECT Rule_Name__c, Discount_Percentage__c, Customer_Segment__c,
                                           Product_Category__c, Product_Validity__c
                                           FROM Discount_Rules__mdt 
                                           WHERE Customer_Segment__c = :customerSegment 
                                           AND Product_Category__c = :productCategory];

        if (!Schema.SObjectType.Discount_Rules__mdt.isAccessible()) {
            return discountPercentage;
        }

        if (rules.isEmpty()) {
            return discountPercentage;
        }

        // Declare 'rule' outside of the loop
        Discount_Rules__mdt rule = rules[0];

        if (!Schema.sObjectType.Discount_Rules__mdt.fields.Discount_Percentage__c.isAccessible()) {
            return discountPercentage;
        }

        // Use 'rule' or perform other actions as needed
        discountPercentage += rule.Discount_Percentage__c;

        // Query discount values for specific documents (not used in the current code)
        // discountvalue__c document = discountvalue__c.getValues('demo1');

        return discountPercentage;
    }
}