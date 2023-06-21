package usb.example;

public class B {
    private final String message;

    public B() {
        this.message = "Hello World!";
    }

    public String getMessageB() {
        return this.message;
    }

    public static void main(String[] args) {
        System.out.println(new B().getMessageB());
    }
}