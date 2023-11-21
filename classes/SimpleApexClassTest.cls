@isTest
public class SimpleApexClassTest {

    @isTest
    static void testConcatenateStrings() {
        String result = SimpleApexClass.concatenateStrings('Hello', 'World');
        System.assertEquals('Hello World', result, 'Concatenation should be successful.');
    }

    @isTest
    static void testAddNumbers() {
        Integer result = SimpleApexClass.addNumbers(5, 7);
        System.assertEquals(12, result, 'Addition should be successful.');
    }

    @isTest
    static void testRunWithSpecialPermissions() {
        // Add your test logic inside the System.runAs() block if needed
        System.runAs(new User(Id = UserInfo.getUserId())) {
            // Your test logic here
        }
    }
}