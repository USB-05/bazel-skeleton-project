package usb.example;

public class App {
    private final String message;

    public App() {
        this.message = "Hello World!";
    }

    public String getMessageApp() {
        return this.message;
    }

    public static void main(String[] args) {
        System.out.println(new App().getMessageApp());
    }
}