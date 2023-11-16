/**
 * The OpportunityTrigger trigger applies discounts to Opportunities before insertion or update.
 */
trigger OpportunityTrigger on Opportunity (before insert, before update) {

    /**
     * Applies discount percentage to a list of Opportunities based on custom rules.
     *
     * @param opps The list of Opportunities to which discounts should be applied.
     */
    public static void applyDiscountPercentage(List<Opportunity> opps) {
        for (Opportunity opp : opps) {
            Decimal discount = DiscountClass.applyDiscount(opp.Customer_Segment__c, opp.Product_Category__c);
            opp.Discount_Percentage__c = discount;
        }
    }

    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            applyDiscountPercentage(Trigger.new);
        }
    }
}