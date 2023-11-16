trigger OpportunityTrigger on Opportunity (before insert, before update) {
    public static void applyDiscountPercentage(List<Opportunity> opps){
        for (Opportunity opp : opps) {
            Decimal discount = discountclass.applyDiscount(opp.Customer_Segment__c, opp.Product_Category__c);
            opp.Discount_Percentage__c = discount;
        }
    }

    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            applyDiscountPercentage(Trigger.new);
        }
    }
}