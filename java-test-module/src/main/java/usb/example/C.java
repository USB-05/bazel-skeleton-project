package usb.example;

public class C {
    private final String message;

    public C() {
        this.message = "Hello World!";
    }

    public String getMessageC() {
        return this.message;
    }

    public static void main(String[] args) {
        System.out.println(new C().getMessageC());
    }
}