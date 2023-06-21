package usb.example;

public class AImpl implements A {
        private final String message;

    public AImpl(String message) {
        this.message = message;
    }

    public String getMessageA() {
            return this.message;
//        if ( this.message != null )
//            return this.message;
//        else
//            return "ABCD";
    }

    public static void main(String[] args) {
        System.out.println(new AImpl("Hello World!").getMessageA());
    }
}