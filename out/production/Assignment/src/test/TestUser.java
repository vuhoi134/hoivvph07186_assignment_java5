package test;

import org.testng.Assert;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
public class TestUser {
    @Parameters({ "User", "Pass" })
    @Test(priority = 8)
    public void test(String User, String Pass) {
        if (User.contentEquals("@@@") && Pass.contentEquals("admin")) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "User2", "Pass2" })
    @Test(priority = 9)
    public void test2(String User2, String Pass2) {
        if (User2.trim().length()==0 && Pass2.trim().length()==0) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "User3", "Pass3" })
    @Test(priority = 10)
    public void test3(String User3, String Pass3) {
        if (User3.trim().length()==0 && Pass3.contentEquals("admin")) {
            Assert.assertTrue(false);
        }
    }
    @Parameters({ "User4", "Pass4" })
    @Test(priority =11)
    public void test4(String User4, String Pass4) {
        if (User4.contentEquals("admin") && Pass4.contentEquals("admin123")) {
            Assert.assertTrue(true);
        }
    }
}
