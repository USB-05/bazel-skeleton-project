package usb.example;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class AppTest {
    @Test
    public void getMessageApp() {
        App app = new App();
        assertEquals("Default message is valid", app.getMessageApp(), "Hello World!");
    }
}