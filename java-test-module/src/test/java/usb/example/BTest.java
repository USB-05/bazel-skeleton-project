package usb.example;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class BTest {
    @Test
    public void getMessageB() {
        B app = new B();
        assertEquals("Default message is valid", app.getMessageB(), "Hello World!");
    }
}