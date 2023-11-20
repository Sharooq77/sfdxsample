@isTest
private class MyMathClassTest {

    @isTest
    static void testAddNumbers() {
        Integer result = MyMathClass.addNumbers(3, 4);
        System.assertEquals(7, result, 'The sum should be 7.');
    }

    @isTest
    static void testMultiplyNumbers() {
        Integer result = MyMathClass.multiplyNumbers(2, 5);
        System.assertEquals(10, result, 'The product should be 10.');
    }

    // You can add more test methods for other functionalities if needed
}