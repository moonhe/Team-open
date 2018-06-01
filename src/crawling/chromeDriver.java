package crawling;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class chromeDriver {

	public static String driverPath = "/Users/moonhe/Desktop/chromedriver_mac64/";
	public static WebDriver driver;

	public  int searchBook() {
		System.out.println("launching chrome browser");
		System.setProperty("webdriver.chrome.driver", driverPath + "chromedriver");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		driver = new ChromeDriver(options);

		// driver.navigate().to("https://ecampus.cbnu.ac.kr");
		driver.get("https://ecampus.cbnu.ac.kr");
		driver.findElement(By.name("user_id")).sendKeys("2012030014");
		driver.findElement(By.name("password")).sendKeys("sjrnfl1!2!");
		driver.findElement(By.name("login")).submit();

		List<WebElement> courseList = driver.findElements(By.partialLinkText("20181"));
		for (int i = 0; i < courseList.size(); i++)
			System.out.println(courseList.get(i).getText());

		driver.findElement(By.partialLinkText("20181")).click();
		driver.findElement(By.partialLinkText("강의계획서")).click();

		List<WebElement> majorBooks = driver.findElements(By.tagName("span"));
		System.out.println(majorBooks.get(69).getText());
		// driver.navigate().to("https://ecampus.cbnu.ac.kr");

		driver.close();
		return 0;
	}
	
	public static int Add() {
		System.out.println("Sads");
		return 0;
	}
}
