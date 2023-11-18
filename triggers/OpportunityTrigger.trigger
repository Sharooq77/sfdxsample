/**
 * The OpportunityTrigger trigger applies discounts to Opportunities before insertion or update.
 */
trigger OpportunityTrigger on Opportunity (before insert, before update) {

    // Call a handler class to perform the necessary logic
    OpportunityTriggerHandler.applyDiscountPercentage(Trigger.new);
}