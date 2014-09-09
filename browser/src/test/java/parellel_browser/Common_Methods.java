package parellel_browser;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.testng.annotations.Test;

import Parallel_Browser.Init.Common;
import Parallel_Browser.Init.MyCommon;
import Parallel_Browser.Init.SeleniumInit;

public class Common_Methods extends SeleniumInit {
	
	
	Common common = new Common(driver);
	MyCommon mycommon = new MyCommon();
	
	@FindBy(xpath = ".//*[@id='footer-list']/li[3]/a")
	private WebElement help;
	
	@FindBy(xpath = ".//*[@id='pubToolbar_tr']/div")
	private WebElement hide;
	
	@FindBy(xpath = "//*[@id='footer']/table/tbody/tr/td[2]/table/tbody/tr/td/a[2]")
	private WebElement element;
	

	
	
	@Test
	public void demons(){
		
	
		
		mycommon.log_case("Some extra methods Test");
		mycommon.log_step("Open URL");
		
		common.pause(3);
		System.out.println("Passed");
		
		//hide.click();
		
		
		
		common.pause(3);
		
//		Actions actions = new Actions(driver);
//	    actions.moveToElement(element).build().perform();
////		
//		Coordinates coo = ((Locatable)help).getCoordinates();
//		coo.inViewPort();
//		
//		System.out.println("ticker");
//		
//		common.pause(5);
//		
		driver.findElement(By.cssSelector("body")).sendKeys(Keys.CONTROL +"t");
		common.pause(2);
		String url = "https://www.google.com";
		driver.get(url);
		
		WebElement element = driver.findElement(By.xpath(".//*[@id='gb']/div[1]/div[1]/div[1]/div[2]/a"));
		WebElement target = driver.findElement(By.name("q"));

		(new Actions(driver)).dragAndDrop(element, target).perform();
		
		common.pause(2);
	}
	

}
