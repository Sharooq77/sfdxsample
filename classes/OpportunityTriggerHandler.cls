/**
* @description This class handles operations related to Opportunities triggered before insert or update.
*/
public class OpportunityTriggerHandler {
    
    /**
	* Applies discount percentage to a list of Opportunities based on custom rules.
	*  @description  frist thing 
	* @param opps The list of Opportunities to which discounts should be applied.
	*/
    public static void handleOpportunities(List<Opportunity> opps) {
        applyDiscountPercentage(opps);
        // Add other logic as needed
    }
    
    /**
     * @description Calculates discounts for each opportunity based on customer segments and 
     * product categories, and assigns the calculated discount percentage to the
     * 'Discount_percentage__c' field in the Opportunity object.
     * 
     * @param opportunities A list of Opportunity objects for which discounts need to be calculated.
     */
    private static void applyDiscountPercentage(List<Opportunity> opps) {
        for (Opportunity opp : opps) {
            Decimal discount = DiscountClass.applyDiscount(opp.Customer_Segment__c, opp.Product_Category__c);
            opp.Discount_Percentage__c = discount;
        }
    }
}