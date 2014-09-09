package parellel_browser;

import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import Parallel_Browser.Init.Common;
import Parallel_Browser.Init.MyCommon;
import Parallel_Browser.Init.SeleniumInit;

public class Parallel_Browser {
	
	//Common common = new Common(driver);
	MyCommon mycommon = new MyCommon();
	
	WebDriver driver = null;
	
	@DataProvider(name="browser" , parallel=true)
	public static Object[][] getbrowser(){
		
		return new Object[][]{
				{"firefox"} , 
				{"chrome"}
		};
	}

	

	
	
	@Test(dataProvider = "browser")
	public void test_page(String browser){
		
		 URL url = null;
		try {
			url = new URL("http://localhost:4444/wd/hub");
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(browser.equals("firefox")){
			 DesiredCapabilities capability=new DesiredCapabilities();
			   capability.setBrowserName(browser);
			   driver=new RemoteWebDriver(url,capability);
		}
		else{
			DesiredCapabilities capability=new DesiredCapabilities();
			System.setProperty("webdriver.chrome.driver",
					"I:\\Work\\chromedriver.exe");
			// driver = new ChromeDriver();
			capability = DesiredCapabilities.chrome();
			capability.setBrowserName("chrome");
			capability.setJavascriptEnabled(true);
			
			driver = new ChromeDriver(capability);
		}
		
		mycommon.log_case("Case 1: OPen Google");
		
		driver.get("http://www.google.com");
		
		mycommon.log_step("Open URl Done");
	}
	
	
	
	
	

}
