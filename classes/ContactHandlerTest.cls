@isTest 
public class ContactHandlerTest {
    @isTest
    static void testUpdateContactTitle() {
        // Create a test Contact
        Contact testContact = new Contact(FirstName = 'John', LastName = 'Doe');
        insert testContact;

        // Call the method from the ContactHandler class
        ContactHandler.updateContactTitle(testContact.Id, 'Manager');

        // Retrieve the updated Contact
        Contact updatedContact = [SELECT Id, Title FROM Contact WHERE Id = :testContact.Id LIMIT 1];

        // Verify that the Title was updated
        System.assertEquals('Manager', updatedContact.Title);
    }
}