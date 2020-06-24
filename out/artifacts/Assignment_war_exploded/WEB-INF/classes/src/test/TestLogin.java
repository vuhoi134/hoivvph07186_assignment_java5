package test;

import org.testng.Assert;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
public class TestLogin {
    @Parameters({ "Username", "Password" })
    @Test
    public void test(String Username, String Password) {
        if (!Username.contentEquals("admin") && !Password.contentEquals("admin")) {
            Assert.assertTrue(true);
        }
    }

    @Parameters({ "Username1", "Password1" })
    @Test(priority = 1)
    public void test1(String Username1, String Password1) {
        if (Username1.trim().length()==0 && Password1.trim().length()==0) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "Username2", "Password2" })
    @Test(priority = 2)
    public void test2(String Username2, String Password2) {
        if (Username2.contentEquals("admin") && Password2.trim().length()==0) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "Username3", "Password3" })
    @Test(priority = 3)
    public void test3(String Username3, String Password3) {
        if (Username3.contentEquals("admin") && Password3.trim().length()==0) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "Username4", "Password4" })
    @Test(priority = 4)
    public void test4(String Username4, String Password4) {
        if (Username4.trim().length()==0 && Password4.contentEquals("admin")) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "Username5", "Password5" })
    @Test(priority = 5)
    public void test5(String Username5, String Password5) {
        if (Username5.trim().length()==0 && Password5.contentEquals("admin123")) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "Username6", "Password6" })
    @Test(priority = 6)
    public void test6(String Username6, String Password6) {
        if (Username6.contentEquals("admin123") && Password6.trim().length()==0) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "Username7", "Password7" })
    @Test(priority = 7)
    public void test7(String Username7, String Password7) {
        if (Username7.contentEquals("@@@@@") && Password7.trim().length()==0) {
            Assert.assertTrue(false);
        }
    }




}
