public class SampleClass {

    // Constructor method
    public SampleClass() {
        // Constructor code
    }

    // Instance method
    public void instanceMethod() {
        System.debug('This is an instance method.');
    }

    // Static method
    public static void staticMethod() {
        System.debug('This is a static method.');
    }

    // Getter method
    public String getGreeting() {
        return 'Hello, Salesforce!';
    }

    // Setter method
    public void setGreeting(String message) {
        System.debug('Setting greeting to: ' + message);
    }

    // Overloaded method
    public Integer addNumbers(Integer a, Integer b) {
        return a + b;
    }

    public Double addNumbers(Double a, Double b) {
        return a + b;
    }
}
