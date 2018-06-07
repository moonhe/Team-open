package Api;

public class Test {
	public static void main(String[] args) {
		  // BookAPIDAO 클래스의 메소드 검사
		  String bookName = "openAPI"; // 검색하고자 하는 책의 키워드
		  String start = "1"; // 페이지 번호, 기본값 1.
		  String maxResults = "20"; // 한 번에 요청할 수 있는 row의 수. 기본값 10.
		  
		  try {
		   BookAPIDAO dao = new BookAPIDAO(bookName, start, maxResults);
		   System.out.printf("getTotalResults():%s%n", dao.getTotalResults());
		   System.out.printf("getReturnCode():%s%n", dao.getReturnCode());
		   
		   for (BookAPI book : dao.list()) {
			   System.out.printf("title:%s%n", book.getTitle());
			   System.out.printf("coverSmallUrl:%s%n", book.getCoverSmallUrl());
			   System.out.printf("link:%s%n", book.getLink());
		   }
		  } catch (Exception e) {
		   e.printStackTrace();
		  }
	}
}