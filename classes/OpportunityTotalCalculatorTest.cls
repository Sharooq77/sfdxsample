@isTest
public class OpportunityTotalCalculatorTest {

    @isTest
    static void testCalculateTotalAmount() {
        // Create test opportunities with required fields (StageName and CloseDate)
        Opportunity opp1 = new Opportunity(Name = 'Opportunity 1', Amount = 1000, StageName = 'Prospecting', CloseDate = Date.today().addDays(30));
        Opportunity opp2 = new Opportunity(Name = 'Opportunity 2', Amount = 2500, StageName = 'Qualification', CloseDate = Date.today().addDays(45));
        Opportunity opp3 = new Opportunity(Name = 'Opportunity 3', Amount = 500, StageName = 'Negotiation', CloseDate = Date.today().addDays(60));

        // Insert opportunities into the database
        insert new List<Opportunity>{opp1, opp2, opp3};

        // Create a list of opportunities to pass to the calculator
        List<Opportunity> opportunityList = [SELECT Id, Amount FROM Opportunity];

        // Calculate the total amount using the OpportunityTotalCalculator class
        Decimal totalAmount = OpportunityTotalCalculator.calculateTotalAmount(opportunityList);

        // Verify that the total amount is calculated correctly
        System.assertEquals(4000, totalAmount, 'Total amount should be 4000.');
    }
}