package Api;

import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.io.IOException;
import java.net.URL;
import java.util.*;
import org.xml.sax.*;
import javax.xml.xpath.*; //XPath 

public class BookAPIDAO {
 private Document xmlObj = null;
 private XPath xPath = null;
 
 //인증키는 개인별 발급 인증키 사용할 것.
 private String key = "FC69C2F3CAFEF6EDB769D1A2F527A61C6A8F8F0F3E6143C16AE92551FED835E8";

 public BookAPIDAO() {
 }

 public BookAPIDAO(String bookName, String start, String maxResults) 
   throws ParserConfigurationException, SAXException, IOException {
  //객체 생성 과정
  DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
  DocumentBuilder builder = factory.newDocumentBuilder();

  String str = String.format("http://book.interpark.com/api/search.api?key=%s&query=%s&start=%s&maxResults=%s&inputEncoding=euc-kr", key, bookName, start, maxResults);
  URL url = new URL(str);
  InputSource is = new InputSource(url.openStream());
  xmlObj = builder.parse(is);

  xPath = XPathFactory.newInstance().newXPath();
 }
 
 //검색한 책의 전체 권수
  public String getTotalResults() throws XPathExpressionException {
  String result = "0";
  result = (String)xPath.compile("/channel/totalResults").evaluate(xmlObj, XPathConstants.STRING);
  return result;
 }

 //에러 코드(000 정상, 이외 나머지 에러)
 public String getReturnCode() throws XPathExpressionException {
  String result = "001";
  result = (String)xPath.compile("/channel/returnCode").evaluate(xmlObj, XPathConstants.STRING);
  return result;
 }

 //검색한 책의 정보 목록
 public ArrayList<BookAPI> list() throws XPathExpressionException {
  ArrayList<BookAPI> result = new ArrayList<BookAPI>();
  NodeList itemNodeLists = (NodeList) xPath.compile("/channel/item").evaluate(xmlObj, XPathConstants.NODESET);
  
  for (int i = 0; i < itemNodeLists.getLength(); ++i) {   
   BookAPI b = new BookAPI();
   b.setCoverSmallUrl((String)xPath.compile(String.format(String.format("/channel/item[%s]/coverSmallUrl", (i+1)))).evaluate(xmlObj, XPathConstants.STRING));
   b.setTitle((String)xPath.compile(String.format(String.format("/channel/item[%s]/title", (i+1)))).evaluate(xmlObj, XPathConstants.STRING));
   b.setPublisher((String)xPath.compile(String.format(String.format("/channel/item[%s]/publisher", (i+1)))).evaluate(xmlObj, XPathConstants.STRING));
   b.setAuthor((String)xPath.compile(String.format(String.format("/channel/item[%s]/author", (i+1)))).evaluate(xmlObj, XPathConstants.STRING));
   b.setPriceStandard((String)xPath.compile(String.format(String.format("/channel/item[%s]/priceStandard", (i+1)))).evaluate(xmlObj, XPathConstants.STRING));
   b.setIsbn((String)xPath.compile(String.format(String.format("/channel/item[%s]/isbn", (i+1)))).evaluate(xmlObj, XPathConstants.STRING));
   b.setLink((String)xPath.compile(String.format(String.format("/channel/item[%s]/link", (i+1)))).evaluate(xmlObj, XPathConstants.STRING));

   result.add(b);
  }

  return result;
 }
}
