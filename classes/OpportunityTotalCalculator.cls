public class OpportunityTotalCalculator {

    /**
     * Calculates the total amount for a list of opportunities.
     * @description
     * @param opportunities The list of opportunities.
     * @return The total amount of all opportunities.
     */
    public static Decimal calculateTotalAmount(List<Opportunity> opportunities) {
        Decimal totalAmount = 0;

        for (Opportunity opp : opportunities) {
            if (opp.Amount != null) {
                totalAmount += opp.Amount;
            }
        }

        return totalAmount;
    }
}