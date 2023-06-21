package usb.example;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class CTest {
    @Test
    public void getMessageC() {
        C app = new C();
        assertEquals("Default message is valid", app.getMessageC(), "Hello World!");
    }
}