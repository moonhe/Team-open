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
	private String Semester;
	public String Books[];
	public String findBook;
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

	public String getSemester() {
		return Semester;
	}

	public void setSemester(String Semester) {
		this.Semester = Semester;
	}

	public int searchBook(String ID, String PWD, String semester) {

		if (semester.equals("1st semester of 2018")) {
			setSemester("20181");
		} else if (semester.equals("2st semester of 2017")) {
			setSemester("20173");
		} else if (semester.equals("1st semester of 2017")) {
			setSemester("20171");
		}else if (semester.equals("Winter semester of 2017")) {
			setSemester("20174");
		}else if (semester.equals("Summer semester of 2017")) {
			setSemester("20172");
		}


		System.out.println(getSemester());
		System.out.println("launching chrome browser");
		System.setProperty("webdriver.chrome.driver", driverPath + "chromedriver");
		
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		driver = new ChromeDriver(options);

		// driver.navigate().to("https://ecampus.cbnu.ac.kr");
		driver.get("https://ecampus.cbnu.ac.kr");
		driver.findElement(By.name("user_id")).sendKeys(ID);
		driver.findElement(By.name("password")).sendKeys(PWD);
		driver.findElement(By.name("login")).submit();

		courseList = driver.findElements(By.partialLinkText(getSemester()));
		course = new String[courseList.size()];
		Books = new String[courseList.size()];
		for (int i = 0; i < courseList.size(); i++) {
			System.out.println(courseList.get(i).getText());
			course[i] = courseList.get(i).getText().substring(5, courseList.get(i).getText().length());
		}

		for (int i = 0; i < courseList.size(); i++) {
			driver.findElement(By.partialLinkText(course[i])).click();
			driver.findElement(By.partialLinkText("강의계획서")).click();
			findBook = driver.findElement(By.xpath("//*[@id=\'containerdiv\']/table[15]/tbody/tr[1]/td/span"))
					.getText();
			Books[i] = findBook;
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
