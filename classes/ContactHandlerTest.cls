@isTest
private class ContactHandlerTest {

    @isTest
    static void testUpdateContactTitle() {
        // Create a test user with limited CRUD permissions
        Profile limitedProfile = [SELECT Id FROM Profile WHERE Name='Limited User'];
        User limitedUser = new User(Alias = 'limitedt', Email='limiteduser@testorg.com',
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
            LocaleSidKey='en_US', ProfileId = limitedProfile.Id, TimeZoneSidKey='America/Los_Angeles',
            UserName='limiteduser@testorg.com');
        insert limitedUser;

        // Declare the testContact variable outside the try block
        Contact testContact;

        // Run the test as the limited user
        System.runAs(limitedUser) {
            // Attempt to create a test Contact
            try {
                testContact = new Contact(FirstName = 'John', LastName = 'Doe');
                insert testContact;
                System.assert(false, 'User should not have permission to create a contact.');
            } catch (Exception e) {
                // Expected exception for lack of permission
            }

            // Attempt to update the Title field of the test Contact
            try {
                ContactHandler.updateContactTitle(testContact.Id, 'Manager');
                System.assert(false, 'User should not have permission to update the contact title.');
            } catch (Exception e) {
                // Expected exception for lack of permission
            }

            // Attempt to query the updated Contact
            try {
                Contact updatedContact = [SELECT Id, Title FROM Contact WHERE Id = :testContact.Id LIMIT 1];
                System.assert(false, 'User should not have permission to query the contact.');
            } catch (Exception e) {
                // Expected exception for lack of permission
            }
        }
    }
}