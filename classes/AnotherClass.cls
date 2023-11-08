public class AnotherClass {

    // Private variables
    private Integer number;

    // Constructor method
    public AnotherClass() {
        // Initialize variables in the constructor
        number = 0;
    }


    // Method to calculate the square of an integer
    public Integer square(Integer a) {
        return a * a;
    }

    // Method to concatenate two strings
    public String concatenateStrings(String str1, String str2) {
        return str1 + str2;
    }

    // Static method to display a static message
    public static void staticMessage() {
        System.debug('This is a static method in AnotherClass.');
    }
}
