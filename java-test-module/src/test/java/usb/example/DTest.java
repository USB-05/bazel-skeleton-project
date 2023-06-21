package usb.example;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class DTest {
    @Test
    public void getMessageATest() {
        AImpl app = new AImpl("Hello World!");
        assertEquals("Default message is valid", app.getMessageA(), "Hello World!");
    }
}