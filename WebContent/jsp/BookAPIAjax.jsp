<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true"%>
<%@ page import="Api.*"%>

<%

 //데이터 수신->keyword

 request.setCharacterEncoding("UTF-8");

 String keyword = request.getParameter("keyword");

 String maxResults = request.getParameter("maxResults");

 String start = request.getParameter("start");
 keyword = keyword.replaceAll(" ","");



 //데이터베이스(원격 XML) 액션-> list() 메소드 호출

 String bookName = keyword; // 검색하고자 하는 책의 키워드

 //String start = "1"; // 페이지 번호, 기본값 1.

 //String maxResults = "10"; // 한 번에 요청할 수 있는 row의 수. 기본값 10.

 BookAPIDAO dao = new BookAPIDAO(bookName, start, maxResults);



 //동적 XML 생성

 /*  

 <?xml version="1.0" encoding="UTF-8"?>

 <bookAPI>

  <totalResults></totalResults>

  <bookInfo>

   <coverSmallUrl><![CDATA[   ]]></coverSmallUrl>

   <title><![CDATA[   ]]></title>

   <publisher><![CDATA[   ]]></publisher>

   <author><![CDATA[   ]]></author>

   <priceStandard><![CDATA[   ]]></priceStandard>

   <isbn><![CDATA[   ]]></isbn>

   <link><![CDATA[   ]]></link>

  </bookInfo>

 </bookAPI> 

 */

 StringBuilder sb = new StringBuilder();
 sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
 sb.append("<bookAPI>");
 sb.append(String.format("<totalResults>%s</totalResults>", dao.getTotalResults()));

 for (BookAPI book : dao.list()) {
  sb.append(String.format("<bookInfo>"));
  sb.append(String.format("<coverSmallUrl><![CDATA[%s]]></coverSmallUrl>", book.getCoverSmallUrl()));
  sb.append(String.format("<title><![CDATA[%s]]></title>", book.getTitle()));
  sb.append(String.format("<publisher><![CDATA[%s]]></publisher>", book.getPublisher()));
  sb.append(String.format("<author><![CDATA[%s]]></author>", book.getAuthor()));
  sb.append(String.format("<priceStandard><![CDATA[%s]]></priceStandard>", book.getPriceStandard()));
  sb.append(String.format("<link><![CDATA[%s]]></link>", book.getLink()));
  sb.append(String.format("</bookInfo>"));
 }
 sb.append("</bookAPI>"); 

 //Ajax 응답
 response.setContentType("text/xml; charset=UTF-8");
 response.getWriter().write(sb.toString()); 
%>