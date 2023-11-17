/**
 * @description This class handles operations related to Opportunities triggered before insert or update.
 */
public class OpportunityTriggerHandler {
    
    /**
     * @description Applies discount percentage to a list of Opportunities based on custom rules.
     *
     * @param opps The list of Opportunities to which discounts should be applied.
     */
    public static void handleOpportunities(List<Opportunity> opps) {
        applyDiscountPercentage(opps);
        // Add other logic as needed
    }

    /**
     * @description Applies discount percentage to individual Opportunity based on custom rules.
     *
     * @param opp The Opportunity to which the discount should be applied.
     */
    private static void applyDiscountPercentage(List<Opportunity> opps) {
        for (Opportunity opp : opps) {
            Decimal discount = DiscountClass.applyDiscount(opp.Customer_Segment__c, opp.Product_Category__c);
            opp.Discount_Percentage__c = discount;
        }
    }
}