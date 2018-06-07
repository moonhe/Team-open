package crawling;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class chromeDriver2 {
	
	public String sr_word;
	public static String driverPath = "C:/Users/wsfee/OneDrive/���� ȭ��/chrome/"; // ����̹� ��ġ
	public static WebDriver driver;

	public int BuyBook() {
		System.out.println("launching chrome browser");
		System.setProperty("webdriver.chrome.driver", driverPath + "chromedriver");
		//����̹� ����
		
		
//		ChromeOptions options = new ChromeOptions();
//		options.addArguments("headless");
//		driver = new ChromeDriver(options);	
		
		driver.get("https://www.kyobobook.co.kr"); //ã���� �ϴ� �ּ�
		driver.findElement(By.name("searchKeyword")).sendKeys(sr_word);
		driver.findElement(By.className("btn_search")).submit();	//name�� ��� class�� ����
		

		List<WebElement> courseList = driver.findElements(By.partialLinkText("20181"));
		for (int i = 0; i < courseList.size(); i++)
			System.out.println(courseList.get(i).getText());

		driver.findElement(By.partialLinkText("20181")).click();
		driver.findElement(By.partialLinkText("���ǰ�ȹ��")).click();

		List<WebElement> majorBooks = driver.findElements(By.tagName("span"));
		System.out.println(majorBooks.get(69).getText());

		driver.close();
		return 0;
	}
}
