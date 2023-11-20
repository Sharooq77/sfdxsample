/**
 * The ContactHandler class provides methods for handling Contact records.
 */
public with sharing class ContactHandler {

    /**
     * Updates the Title field of a Contact record.
     *
     * @param contactId The ID of the Contact record to be updated.
     * @param newTitle The new title to be set for the Contact.
     * @throws DmlException if the update operation fails.
     */
    public static void updateContactTitle(String contactId, String newTitle) {
        try {
            // Query the Contact record
            Contact con = [SELECT Id, Title FROM Contact WHERE Id = :contactId LIMIT 1];

            // Update the Title field
            con.Title = newTitle;

            // Update the Contact record
            update con;
        } catch (DmlException e) {
            // Handle DML exception, log, or rethrow as needed
            System.debug('DML Exception: ' + e.getMessage());
            throw e;
        }
    }
}