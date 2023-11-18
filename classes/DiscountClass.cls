/**
 * @description
 * The DiscountClass class provides methods for applying discounts based on custom metadata rules.
 */
public without sharing class DiscountClass {

    /**
     * Applies a discount based on custom metadata rules.
     *
     * @param customerSegment The customer segment for which the discount is being applied.
     * @param productCategory The product category for which the discount is being applied.
     * @return The calculated discount percentage.
     * 
     * @description This method calculates and applies discounts based on custom metadata rules. It queries
     *              relevant information from Discount_Rules__mdt and accumulates the discount percentages
     *              based on the provided customer segment and product category.
     */
    public static Decimal applyDiscount(String customerSegment, String productCategory) {
        Decimal discountPercentage = 0;

        List<Discount_Rules__mdt> rules = new List<Discount_Rules__mdt>();
        // Query discount values for specific documents 
        discountvalue__c document = discountvalue__c.getValues('demo1');
        //document.Discount_Percentage__c = 0; // Assign a default value or your intended value

        // Query Custom Metadata for applicable rules only if it is accessible
        if (Schema.sObjectType.Discount_Rules__mdt.isAccessible()) {
            rules = [SELECT Rule_Name__c, Discount_Percentage__c, Customer_Segment__c,
                     Product_Category__c, Product_Validity__c
                     FROM Discount_Rules__mdt 
                     WHERE Customer_Segment__c = :customerSegment 
                     AND Product_Category__c = :productCategory];
        }
                    
        // Now, accumulate discount percentages based on rules
        for (Discount_Rules__mdt rule : rules) {
            discountPercentage += rule.Discount_Percentage__c;
        }

        return discountPercentage;
    }
}