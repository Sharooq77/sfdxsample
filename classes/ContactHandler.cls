public class ContactHandler {
    public static void updateContactTitle(String contactId, String newTitle) {
        Contact con = [SELECT Id, Title FROM Contact WHERE Id = :contactId LIMIT 1];
        con.Title = newTitle;
        update con;
    }
}