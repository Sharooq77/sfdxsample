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

        // Check if the user has permission to query Discount_Rules__mdt
        if (Schema.SObjectType.Discount_Rules__mdt.isQueryable()) {

            // Query Custom Metadata for applicable rules
            List<Discount_Rules__mdt> rules = [SELECT Rule_Name__c, Discount_Percentage__c, Customer_Segment__c,
                                               Product_Category__c, Product_Validity__c
                                               FROM Discount_Rules__mdt 
                                               WHERE Customer_Segment__c = :customerSegment 
                                               AND Product_Category__c = :productCategory];
            
            // Declare 'rule' outside of the loop
            Discount_Rules__mdt rule;

            // Check if the user has permission to read Discount_Rules__mdt records
            if (Schema.SObjectType.Discount_Rules__mdt.isAccessible()) {

                // Assign the first rule to 'rule' if there are rules
                if (!rules.isEmpty()) {
                    rule = rules[0];

                    // Check if the user has permission to read Discount_Rules__mdt fields
                    if (Schema.sObjectType.Discount_Rules__mdt.fields.Discount_Percentage__c.isAccessible()) {

                        // Use 'rule' or perform other actions as needed
                        discountPercentage += rule.Discount_Percentage__c;
                    }
                }
            }
        }

        // Query discount values for specific documents (not used in the current code)
         discountvalue__c document = discountvalue__c.getValues('demo1');

        return discountPercentage;
    }
}