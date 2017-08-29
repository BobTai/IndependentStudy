package health;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.mysql.jdbc.PreparedStatement;

public class JsonParsing {
	public String getNodeNameValue(NodeList nodeLst, int s, String nodeKey) {
		String strnodeKey = "";

		Node fstNode = nodeLst.item(s);

		if (fstNode.getNodeType() == Node.ELEMENT_NODE) {
			Element fstElmnt = (Element) fstNode;
			NodeList fstNmElmntLst = fstElmnt.getElementsByTagName(nodeKey);
			Element fstNmElmnt = (Element) fstNmElmntLst.item(0);
			NodeList fstNm = fstNmElmnt.getChildNodes();
			strnodeKey = "" + fstNm.item(0).getNodeValue();
		}

		return strnodeKey;

	}
	public String gethello(String latitudeNum,String longitudeNum){
		try {
			String tempUrl = "https://maps.googleapis.com/maps/api/place/search/xml?location="+latitudeNum+","+longitudeNum+"&radius=2000&types=health&sensor=false&key=AIzaSyCaLwh1B19zjGjLEf4TOEc0AbE-TDL3sTc";
			URL yahoo = new URL(tempUrl);
			URLConnection yc = yahoo.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
			String inputLine = "";
			PrintWriter writer = new PrintWriter(new File("c:\\temp\\MyXMLFile.xml"));
			while ((inputLine = in.readLine()) != null) {
				//System.out.println(inputLine);
				writer.println(inputLine);
				writer.flush();
			}
			//transfor
			File file = new File("c:\\temp\\MyXMLFile.xml");
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(file);
			doc.getDocumentElement().normalize();

			NodeList nodeLst = doc.getElementsByTagName("result");
			JsonParsing jp = new JsonParsing();
			for (int s = 0; s < nodeLst.getLength(); s++) {//
				try {      

					 // 建立 MySQL 驅動程式
					 Class.forName("com.mysql.jdbc.Driver");
					 //System.out.print("<BR>驅動 MySql 資料庫成功!");
					      
					}catch(Exception E) {
					 //System.out.print("<BR>無法載入 com.mysql.jdbc.Driver ");  
					 E.printStackTrace();  
					} 
					//以下這段一定要用
					try { 
					 
					 // 設定連線,連到資料庫名稱"caidiy5",使用者帳號"mark",密碼"cool",使用UTF-8編碼"true",字元集用"UTF-8"

					 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthysearch?user=root&password=123&useUnicode=true&characterEncoding=UTF-8"); 
					 
					 // 判斷資料庫是否載入成功

					 if(!con.isClosed()){ 
						 //System.out.print("<BR>載入 MySql 資料庫成功!");  
					 }
					String strType="";
					if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("醫院")!=-1){
						strType ="醫院";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("藥")!=-1){
						strType ="藥局";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("耳鼻喉")!=-1){
						strType ="耳鼻喉科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("牙")!=-1){
						strType ="牙醫";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("兒")!=-1){
						strType ="小兒科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("婦產")!=-1){
						strType ="婦產科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("內科")!=-1){
						strType ="內科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("皮膚")!=-1){
						strType ="皮膚科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("復健")!=-1){
						strType ="復健科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("外科")!=-1){
						strType ="外科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("眼")!=-1){
						strType ="眼科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("骨")!=-1){
						strType ="骨科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("復健")!=-1){
						strType ="復健科";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("中醫")!=-1){
						strType ="中醫";
					}
					else if(jp.getNodeNameValue(nodeLst, s, "name").indexOf("檢查")!=-1){
						strType ="健檢中心";
					}
					
					String s_SqlInsert = "insert INTO examination (examination_office_name,latitude_and_longitude,latitude,longitude,address,type,ps) values ('"+jp.getNodeNameValue(nodeLst, s, "name")+"','"+jp.getNodeNameValue(nodeLst, s, "lat")+","+jp.getNodeNameValue(nodeLst, s, "lng")+"','"+jp.getNodeNameValue(nodeLst, s, "lat")+"','"+jp.getNodeNameValue(nodeLst, s, "lng")+"','no','"+strType+"','"+jp.getNodeNameValue(nodeLst, s, "name")+"')";

								 
					 // 執行SQL語法
					 Statement stmt = con.createStatement();//我要執行stmt
					 
					 String s_Sql = "select * FROM examination where examination_office_name='"+jp.getNodeNameValue(nodeLst, s, "name")+"'";//，把材料準備好
					 PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(s_Sql);//要與String s_Sql = "select * FROM student";呼應，準備做
					 ResultSet rs = pstmt.executeQuery(); //真的做
					 
					 // 取出 login 資料表中的內容
					 int i=0;
					 while (rs.next()){  
						 i=1;
			           //System.out.println("<br>" + rs.getString("examination_office_name"));

					 }    
					 if(i==0){
						 stmt.executeUpdate(s_SqlInsert);//我要執行s_SqlInsert
					 }
					 // 關閉連線，要有順序rs, pstmt,stmt,con
					 /*
					 rs.close();
					 rs = null;
					 pstmt.close();
					 pstmt = null;
					 */
					 stmt.close();
					 stmt = null;
					 con.close();  
					           
					}catch(SQLException ex){  
					      
					 System.out.println("<BR>無法載入資料庫");  
					 System.out.println("<BR>handle the error");
					 System.out.println("<BR>SQLException: " + ex.getMessage());
					 System.out.println("<BR>SQLState: " + ex.getSQLState());
					 System.out.println("<BR>VendorError: " + ex.getErrorCode());    
					}       

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "hello";
	}
	public String gethello2(String latitudeNum,String longitudeNum){
		String eFactaddress = "";
		try {
			String tempUrl = "http://maps.google.com/maps/api/geocode/xml?latlng="+latitudeNum+","+longitudeNum+"&sensor=true&language=zh-TW";
			URL yahoo = new URL(tempUrl);
			URLConnection yc = yahoo.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream(),"utf-8"));
			String inputLine = "";
			String inputLine2 = "";
			while ((inputLine = in.readLine()) != null) {
				inputLine2 = inputLine2+inputLine;
				//System.out.println("eFactaddress===>"+inputLine2);
				
			}
			
			eFactaddress = inputLine2.substring(inputLine2.indexOf("<formatted_address>")+19, inputLine2.indexOf("</formatted_address>"));
			System.out.println("eFactaddress===>"+eFactaddress);
		}catch(Exception ex){
			System.out.println(ex);
		}
		return eFactaddress;
	}
	public static void main(String argv[]) {

		try {
			String tempUrl = "https://maps.googleapis.com/maps/api/place/search/xml?location=25.0369675,121.4331186&radius=2000&types=health&sensor=false&key=AIzaSyCaLwh1B19zjGjLEf4TOEc0AbE-TDL3sTc";
			URL yahoo = new URL(tempUrl);
			URLConnection yc = yahoo.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(yc
					.getInputStream()));
			String inputLine = "";
			PrintWriter writer = new PrintWriter(new File("c:\\temp\\MyXMLFile.xml"));
			while ((inputLine = in.readLine()) != null) {
				//System.out.println(inputLine);
				writer.println(inputLine);
				writer.flush();
			}
			//transfor
			File file = new File("c:\\temp\\MyXMLFile.xml");
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(file);
			doc.getDocumentElement().normalize();

			NodeList nodeLst = doc.getElementsByTagName("result");
			JsonParsing jp = new JsonParsing();
			for (int s = 0; s < nodeLst.getLength(); s++) {
				//以下這段一定要用
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}