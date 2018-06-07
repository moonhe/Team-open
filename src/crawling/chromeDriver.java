package crawling;

import java.util.List;
import java.util.StringTokenizer;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.mysql.jdbc.jdbc2.optional.SuspendableXAConnection;

public class chromeDriver {

	public static String driverPath = "/Users/moonhe/Desktop/chromedriver_mac64/";
	public static WebDriver driver;
	public String Semester;
	public String Books[];
	public String course[];
	private String id;
	private String pwd;
	public List<WebElement> courseList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int searchBook(String ID, String PWD) {

		System.out.println("launching chrome browser");
		System.setProperty("webdriver.chrome.driver", driverPath + "chromedriver");
		//
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		driver = new ChromeDriver(options);

		// driver.navigate().to("https://ecampus.cbnu.ac.kr");
		driver.get("https://ecampus.cbnu.ac.kr");
		driver.findElement(By.name("user_id")).sendKeys(ID);
		driver.findElement(By.name("password")).sendKeys(PWD);
		driver.findElement(By.name("login")).submit();

		Semester = "2018 1학기";
		courseList = driver.findElements(By.partialLinkText("20181"));
		course = new String[courseList.size()];
		Books = new String[courseList.size()];
		for (int i = 0; i < courseList.size(); i++) {
			System.out.println(courseList.get(i).getText());
			course[i] = courseList.get(i).getText().substring(5, courseList.get(i).getText().length());
		}

		for (int i = 0; i < courseList.size(); i++) {
			driver.findElement(By.partialLinkText(course[i])).click();
			driver.findElement(By.partialLinkText("강의계획서")).click();
			List<WebElement> majorBooks = driver.findElements(By.tagName("span"));

			if (majorBooks.get(69).getText().substring(0, 1).equals("1")) {
				Books[i] = majorBooks.get(69).getText();
			} else {
				Books[i] = majorBooks.get(70).getText();
			}
			driver.navigate().back();
			driver.findElement(By.partialLinkText("코스")).click();
		}
		// driver.navigate().to("https://ecampus.cbnu.ac.kr");
		driver.close();
		return 0;
	}

	public static int Add() {
		System.out.println("Sads");
		return 0;
	}
}
