@isTest
private class MyMathClassTest {

    @isTest
    static void testAddNumbers() {
        // Test adding two numbers
        Integer result = MyMathClass.addNumbers(3, 4);
        System.assertEquals(7, result, 'The sum should be 7.');

        // Test adding two numbers in a different context (System.runAs)
        System.runAs(new User(Id = UserInfo.getUserId())) {
            // Call the method with parameters
            Integer resultInRunAs = MyMathClass.addNumbers(5, 2);
            // Assert the result
            System.assertEquals(7, resultInRunAs, 'The sum should be 7.');
        }
    }

    @isTest
    static void testMultiplyNumbers() {
        // Test multiplying two numbers
        Integer result = MyMathClass.multiplyNumbers(2, 5);
        System.assertEquals(10, result, 'The product should be 10.');

        // Test multiplying two numbers in a different context (System.runAs)
        System.runAs(new User(Id = UserInfo.getUserId())) {
            // Call the method with parameters
            Integer resultInRunAs = MyMathClass.multiplyNumbers(3, 4);
            // Assert the result
            System.assertEquals(12, resultInRunAs, 'The product should be 12.');
        }
    }

    // You can add more test methods for other functionalities if needed
}