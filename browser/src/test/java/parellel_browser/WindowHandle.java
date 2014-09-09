package parellel_browser;

import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.testng.annotations.Test;

import Parallel_Browser.Init.Common;
import Parallel_Browser.Init.MyCommon;
import Parallel_Browser.Init.SeleniumInit;

public class WindowHandle extends SeleniumInit {
	
	Common common = new Common(driver);
	MyCommon mycommon = new MyCommon();
	
	@Test
	public void windowHandle(){
		
		mycommon.log_case("Switching Windows");
		mycommon.log_step("Open URL");
		
		common.pause(2);
		
		driver.findElement(By.xpath(".//*[@id='menusupport']/li[1]/a/span")).click();
		
		common.pause(3);
		
		Dimension dd = new Dimension(1024, 768);
        
		
		//driver.get("http:www.gmail.com");
				
		common.pause(3);
		
		
		
		common.pause(3);
		
		String handle = driver.getWindowHandle();
		
		Set<String> handles = driver.getWindowHandles();
		
		for(String hnd:handles){
			
			if(!hnd.equals(handle)){
				driver.switchTo().window(hnd);
				driver.manage().window().setSize(dd);
				common.pause(3);
				System.out.println(driver.getTitle());
			}
		}
		
		common.pause(3);
		
		String handle1 = driver.getWindowHandle();
		
		Set<String> handles1 = driver.getWindowHandles();
		
		for(String hnd:handles1){
			
			if(!hnd.equals(handle1)){
				driver.switchTo().window(hnd);
				driver.manage().window().setSize(dd);
				common.pause(3);
				System.out.println(driver.getTitle());
			}
		}
		
		common.pause(5);
		
		
		
	}

}
