package Parallel_Browser.Init;

import java.io.File;import java.io.IOException;import java.lang.reflect.Method;import java.net.URL;
import java.util.logging.Logger;

import org.openqa.selenium.Platform;
import org.openqa.selenium.Proxy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.safari.SafariDriver;
import org.testng.ITestContext;
import org.testng.ITestResult;
import org.testng.Reporter;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeTest;

//import com.linkedin.cases.CreateNewAccount;
//import com.linkedin.pages.CreateNewAccount_Verification;
//import com.linkedin.pages.indexpages.CreateNewAccount_IndexPage;



//import com.qcbs.page.AbstractPage;
//import com.qcbs.pages.indexpages.Tender_approve_IndexPage;
//import com.qcbs.pages.indexpages.Tender_authorize_IndexPage;
//import com.qcbs.pages.indexpages.Tender_bid_Indexpage;
//import com.qcbs.pages.indexpages.Tender_closing_IndexPage;
//import com.qcbs.pages.indexpages.Tender_committe_IndexPage;
//import com.qcbs.pages.indexpages.Tender_creat_meeting_IndexPage;
//import com.qcbs.pages.indexpages.Tender_creation_IndexPage;
//import com.qcbs.pages.indexpages.Tender_open_IndexPage;
//import com.qcbs.pages.indexpages.Tender_prepare_Indexpage;
//import com.qcbs.pages.indexpages.Tender_reencryption_Indexpage;

/**
 * Selenium class Initialization
 * 
 * 
 */

// @Listeners(ATUReportsListener.class)
public class SeleniumInit implements ILoggerStatus {

	/* Minimum requirement for test configuration */

	protected String testUrl; // Test url
	protected String seleniumHub; // Selenium hub IP
	protected String seleniumHubPort; // Selenium hub port
	protected String targetBrowser1,targetBrowser2; // Target browser
	protected static String test_data_folder_path = null;

	String userName = "";
	String password = "";
	// screen-shot folder
	protected static String screenshot_folder_path = null;
	public static String currentTest; // current running test

	protected static Logger logger = Logger.getLogger("testing");

	protected WebDriver driver;
	
	Common common = new Common(driver);

	/* Page's declaration */

//	protected CreateNewAccount_IndexPage CreateNewAccount_IndexPage;
//	protected CreateNewAccount_Verification CreateNewAccount_Verification;
//	protected CreateNewAccount CreateNewAccount;
	/*protected Tender_creation_IndexPage tender_indexpage;
	protected Tender_approve_IndexPage approve_indexpage;
	protected AbstractPage abstractpage;
	protected Tender_prepare_Indexpage tpi_indexpage;
	protected Tender_authorize_IndexPage authorize_indexpage;
	protected Tender_bid_Indexpage bid_indexpage;
	protected Tender_closing_IndexPage close_indexpage;
	protected Tender_reencryption_Indexpage reencryption_indexpage;
    protected Tender_open_IndexPage open_IndexPage;
    protected Tender_committe_IndexPage committe_IndexPage;
    protected Tender_creat_meeting_IndexPage meeting_Indexpage;*/
  
	// protected RegisteredPage registeredPage;
	// And many more ...

	/**
	 * Fetches suite-configuration from XML suite file.
	 * 
	 * @param testContext
	 */
	@BeforeTest(alwaysRun = true)
	public void fetchSuiteConfiguration(ITestContext testContext) {

		System.out.println("--------------------------in fetch config--------------------------");
		testUrl = testContext.getCurrentXmlTest().getParameter("selenium.url");

		
		System.out.println("=======================" + testUrl + "=======================\n");
		

		seleniumHub = testContext.getCurrentXmlTest().getParameter(
				"selenium.host");

		seleniumHubPort = testContext.getCurrentXmlTest().getParameter(
				"selenium.port");

		targetBrowser1 = testContext.getCurrentXmlTest().getParameter(
				"selenium.browser1");
		
		targetBrowser2 = testContext.getCurrentXmlTest().getParameter(
				"selenium.browser2");

	}

	// new code====

	/**
	 * WebDriver initialization
	 * 
	 * @return WebDriver object
	 * @throws IOException
	 * @throws InterruptedException
	 */

	@BeforeMethod(alwaysRun = true)
	public void setUp(Method method) throws IOException, InterruptedException {

		/*
		 * Runtime runtime = Runtime.getRuntime(); runtime.exec(
		 * "java -jar V:\\testing\\selenium-java-2.40.0\\selenium-2.40.0\\selenium-server-standalone-2.33.0.jar -role hub"
		 * );
		 * System.out.println("==================Server started================="
		 * ); Thread.sleep(2000);
		 * 
		 * 
		 * Runtime runtime2 = Runtime.getRuntime(); runtime2.exec(
		 * "java -jar V:\\testing\\selenium-java-2.40.0\\selenium-2.40.0\\selenium-server-standalone-2.33.0.jar -role node -port 5554"
		 * ); System.out.println(
		 * "=======================Node started====================");
		 * Thread.sleep(2000);
		 */
		currentTest = method.getName(); // get Name of current test.

		URL remote_grid = new URL("http://" + seleniumHub + ":"
				+ seleniumHubPort + "/wd/hub");
		
		//System.out.println(remote_grid);

		String SCREENSHOT_FOLDER_NAME = "screenshots";
		String TESTDATA_FOLDER_NAME = "test_data";

		test_data_folder_path = new File(TESTDATA_FOLDER_NAME)
				.getAbsolutePath();

		screenshot_folder_path = new File(SCREENSHOT_FOLDER_NAME)
				.getAbsolutePath();

		DesiredCapabilities capability = null;
		if (targetBrowser1 == null || targetBrowser1.contains("firefox") || targetBrowser2 == null ||
				targetBrowser2.contains("firefox")) {

			FirefoxProfile profile = new FirefoxProfile();

			Proxy proxy = new Proxy();
			proxy.setNoProxy("ipms.ppadb.gov.in");
			proxy.setNoProxy("127.0.0.1");
			proxy.setNoProxy("localhost");
			profile.setPreference("dom.max_chrome_script_run_time", "999");
			profile.setPreference("dom.max_script_run_time", "999");
			profile.setPreference("browser.download.folderList", 2);
			profile.setPreference("browser.download.useDownloadDir", true);
			profile.setPreference("browser.download.manager.showWhenStarting",
					false);
			profile.setEnableNativeEvents(true);
			profile.setPreference("network.http.use-cache", false);

		
			
			
			
			

		/*	
		   	File file = new File("C:/Users/Viral/Downloads/firebug-1.8.4.xpi");
			  
			   profile.addExtension(file);
			   profile.setPreference("extensions.firebug.currentVersion", "1.8.4"); // Avoid startup screen
			*/
			
			capability = DesiredCapabilities.firefox();
			capability.setJavascriptEnabled(true);
			capability.setCapability(FirefoxDriver.PROFILE, profile);

			System.out.println("===========firefox browser===========");
		} else if (targetBrowser1.contains("ie8") || targetBrowser2.contains("ie8")) {

			capability = DesiredCapabilities.internetExplorer();
			capability.setPlatform(Platform.ANY);
			capability.setBrowserName("internet explorer");
			// capability.setVersion("8.0");
			capability
					.setCapability(
							InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS,
							true);
			capability.setCapability(
					CapabilityType.ForSeleniumServer.ENSURING_CLEAN_SESSION,
					true);
			capability.setJavascriptEnabled(true);
		} else if (targetBrowser1.contains("chrome") || targetBrowser2.contains("chrome")) {

			
			System.setProperty("webdriver.chrome.driver",
					"I:\\Work\\chromedriver.exe");
			// driver = new ChromeDriver();
			capability = DesiredCapabilities.chrome();
			capability.setBrowserName("chrome");
			capability.setJavascriptEnabled(true);

			System.out.println("===========chrome browser===========");
		} else if (targetBrowser1.contains("ie9") || targetBrowser2.contains("ie9")) {
			capability = DesiredCapabilities.internetExplorer();
			capability.setBrowserName("internet explorer");
			capability
					.setCapability(
							InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS,
							true);
			capability.setCapability(
					CapabilityType.ForSeleniumServer.ENSURING_CLEAN_SESSION,
					true);
			capability.setJavascriptEnabled(true);
		} else if (targetBrowser1.contains("safari") || targetBrowser2.contains("safari")) {

			// System.setProperty("webdriver.safari.driver","/Users/jesus/Desktop/SafariDriver.safariextz");
			// driver = new SafariDriver();
			SafariDriver profile = new SafariDriver();

			capability = DesiredCapabilities.safari();

			capability.setJavascriptEnabled(true);
			capability.setBrowserName("safari");
			// //capability.setCapability(SafariDriver.CLEAN_SESSION_CAPABILITY,
			// profile);
			this.driver = new SafariDriver(capability);
		}
		driver = new RemoteWebDriver(remote_grid, capability);
		
		//driver = new ChromeDriver(capability);
		
		System.out.println("browser");

		driver.get(testUrl);
		driver.manage().window().maximize();
		System.out.println("Start");

		//CreateNewAccount = new CreateNewAccount(driver);
		//CreateNewAccount_IndexPage = new CreateNewAccount_IndexPage(driver);
		//CreateNewAccount_Verification = new CreateNewAccount_Verification(driver);
//			login_indexpage	= new Login_IndexPage(driver);
//				  login_indexpage = new Login_IndexPage(driver);
//				 
//				  login_indexpage = new Login_IndexPage(driver);
//	
		
	}

	/**
	 * After Method
	 * 
	 * @param testResult
	 */
	@AfterMethod(alwaysRun = true)
	public void tearDown(ITestResult testResult) {
		try {

			String testName = testResult.getName();

			if (!testResult.isSuccess()) {

				/* Print test result to Jenkins Console */
				System.out.println();
				System.out.println("TEST FAILED - " + testName);
				System.out.println();
				System.out.println("ERROR MESSAGE: "
						+ testResult.getThrowable());
				System.out.println("\n");
				Reporter.setCurrentTestResult(testResult);

				/* Make a screenshot for test that failed */
				String screenshotName = common.getCurrentTimeStampString()
						+ testName;
				Reporter.log("<br> <b>Please look to the screenshot - </b>");
				common.makeScreenshot(driver, screenshotName);

			} else {
				System.out.println("TEST PASSED - " + testName + "\n"); // Print
																		// test
																		// result
																		// to
																		// Jenkins
																		// Console

			}

			driver.manage().deleteAllCookies();
			driver.quit();

		} catch (Throwable throwable) {
			System.out.println("message from tear down"
					+ throwable.getMessage());
		}
	}

	/**
	 * Log given message to Reporter output.
	 * 
	 * @param msg
	 *            Message/Log to be reported.
	 */
	public static void logMessage(String msg) {
		Reporter.log(msg + "<br/>");
	}

	public static void log(String msg, final int logger_status) {

		switch (logger_status) {

		case ILoggerStatus.NORMAL:
			Reporter.log("<br>" + msg + "</br>");
			break;

		case ILoggerStatus.ITALIC:
			log("<i>" + msg + "</i>");
			break;

		case ILoggerStatus.STRONG:
			Reporter.log("<strong>" + msg + "</br>");
			break;
		}
	}

	public static void logStatus(final int test_status) {

		switch (test_status) {

		case ITestStatus.PASSED:
			log("<font color=238E23>--Passed</font>");
			break;

		case ITestStatus.FAILED:
			log("<font color=#FF0000>--Failed</font>");
			break;

		case ITestStatus.SKIPPED:
			log("<font color=#FFFF00>--Skipped</font>");
			break;

		default:
			break;
		}

	}

	/**
	 * Log given message to Reporter output.
	 * 
	 * @param msg
	 *            Message/Log to be reported.
	 */
	public static void log(String msg) {
		System.out
				.println("-----------------------------------------------typed in log"
						+ msg);
		Reporter.log(msg);
	}

}
