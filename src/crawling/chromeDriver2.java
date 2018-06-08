package crawling;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class chromeDriver2 {
	
	public String sr_word;
	public static String driverPath = "/Users/moonhe/Desktop/chromedriver_mac64/"; // ����̹� ��ġ
	public static WebDriver driver;

	public static void main (String[] args){
		System.out.println("launching chrome browser");
		System.setProperty("webdriver.chrome.driver", driverPath + "chromedriver");
		
		
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		driver = new ChromeDriver(options);	
		
		driver.get("https://ecampus.cbnu.ac.kr");
		driver.findElement(By.name("user_id")).sendKeys("2012030014");
		driver.findElement(By.name("password")).sendKeys("sjrnfl1!2!");
		driver.findElement(By.name("login")).submit();
		

		List<WebElement> courseList = driver.findElements(By.partialLinkText("20181"));
		for (int i = 0; i < courseList.size(); i++)
			System.out.println(courseList.get(i).getText());

		driver.findElement(By.partialLinkText("20181")).click();
		driver.findElement(By.partialLinkText("강의계획서")).click();

		String major = driver.findElement(By.xpath("//*[@id=\'containerdiv\']/table[15]/tbody/tr[1]/td/span")).getText();
		//List<WebElement> majorBooks = driver.findElements(By.tagName("span"));
		System.out.println(major);
		driver.navigate().back();
		driver.findElement(By.partialLinkText("코스")).click();
		driver.findElement(By.partialLinkText("20181빅")).click();
		driver.findElement(By.partialLinkText("강의계획서")).click();
		 major = driver.findElement(By.xpath("//*[@id=\'containerdiv\']/table[15]/tbody/tr[1]/td/span")).getText();
		 System.out.println(major);
		driver.close();
	}
}
