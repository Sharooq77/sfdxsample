/**
 * @description This class handles operations related to Opportunities triggered before insert or update.
 */
public class OpportunityTriggerHandler {
    
    /**
     * Applies discount percentage to a list of Opportunities based on custom rules.
     *
     * @param opps The list of Opportunities to which discounts should be applied.
     */
    public static void handleOpportunities(List<Opportunity> opps) {
        applyDiscountPercentage(opps);
        // Add other logic as needed
    }
    
    /**
     * Applies discount percentage to an individual Opportunity based on custom rules.
     *
     * @param opp The Opportunity to which the discount should be applied.
     */
    public static void handleOpportunity(Opportunity opp) {
        applyDiscount(opp);
        // Add any other logic related to Opportunity processing
    }

    /**
     * Applies discount percentage to a list of Opportunities based on custom rules.
     *
     * @param opps The list of Opportunities to which discounts should be applied.
     */
    private static void applyDiscountPercentage(List<Opportunity> opps) {
        for (Opportunity opp : opps) {
            applyDiscount(opp);
        }
    }

    /**
     * Applies discount percentage to an individual Opportunity based on custom rules.
     *
     * @param opp The Opportunity to which the discount should be applied.
     */
    private static void applyDiscount(Opportunity opp) {
        // Assuming you have the document variable available somewhere in this class
        // / Query discount values for specific documents 
        discountvalue__c document1  = discountvalue__c.getValues('demo1');
        discountvalue__c document ; // You need to get the document variable here
        Decimal discount = DiscountClass.applyDiscount(opp.Customer_Segment__c, opp.Product_Category__c, document);
        opp.Discount_Percentage__c = discount;
    }
}