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

        List<Discount_Rules__mdt> rules = new List<Discount_Rules__mdt>();

        // Query Custom Metadata for applicable rules only if it is accessible
        if (Schema.sObjectType.Discount_Rules__mdt.isAccessible()) {
            rules = [SELECT Rule_Name__c, Discount_Percentage__c, Customer_Segment__c,
                     Product_Category__c, Product_Validity__c
                     FROM Discount_Rules__mdt 
                     WHERE Customer_Segment__c = :customerSegment 
                     AND Product_Category__c = :productCategory];
        }

        // Check if there are any rules before trying to access the first one
        if (!rules.isEmpty()) {
            // Declare 'rule' outside of the loop
            // Discount_Rules__mdt rule = rules[0];

            // Check if the user has permission to read Discount_Rules__mdt fields
            if (Schema.sObjectType.Discount_Rules__mdt.fields.Discount_Percentage__c.isAccessible()) {
                // Use 'rule' or perform other actions as needed
                // discountPercentage += rule.Discount_Percentage__c;

                // Now, accumulate discount percentages based on rules
                for (Discount_Rules__mdt rule : rules) {
                    discountPercentage += rule.Discount_Percentage__c;
                }
            }
        }

        // Query discount values for specific documents (not used in the current code)
        // discountvalue__c document = discountvalue__c.getValues('demo1');

        return discountPercentage;
    }
}