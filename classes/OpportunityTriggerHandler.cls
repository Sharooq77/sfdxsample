/**
 * @description This class handles operations related to Opportunities triggered before insert or update.
 */
public class OpportunityTriggerHandler {    
    /**
     * @description second 
     * Applies discount percentage to an individual Opportunity based on custom rules.
     *
     * @param opps The Opportunity to which the discount should be applied.
     */
    public static void applyDiscountPercentage(List<Opportunity> opps) {
        // Query discount values for specific documents 
        discountvalue__c document = discountvalue__c.getValues('demo1');
        for (Opportunity opp : opps) {
            opp.Description=' ';
            Decimal discount = DiscountClass.applyDiscount(opp.Customer_Segment__c, opp.Product_Category__c);
            opp.Discount_Percentage__c = discount;
            if(opp.Description==null){
                String s=String.ValueOf(document.Discount_Percentage__c);
                opp.Description=s;
            }else{
                opp.Description='20.0';
            }
        }
    } 
}