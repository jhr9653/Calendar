<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%
  //DB 연결 소스
  
  PreparedStatement pstmt = null;
  String driverName="com.mysql.jdbc.Driver";
  String url = "jdbc:mysql://localhost:3306/Calendar?serverTimezone=UTC";
  String id = "Calendar";
  String pwd ="1234";
 
	  Class.forName(driverName);
	  Connection conn = DriverManager.getConnection(url,id,pwd);
	  if (conn== null) {
	   out.println("Connection Failed.");
	  } 
  %>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>일정 추가</title>
 </head>
 <body>
  <center>
  <H2>일정 추가</H2>
  <HR>
  <form name=MemoAdd method=post action=MemoAdd.jsp>
   <input type=text name=memoYear size=4>년
   <input type=text name=memoMonth size=2>월
   <input type=text name=memoDay size=2>일
   내용 : <input type=text name=memoContents>
   <input type=submit value="추가">
  </form>
   <%
   Statement stmt = conn.createStatement();
  //if (request.getParameter("username") != null) {
   String sql= "INSERT INTO CALENDARMEMO (CALENDARMEMO_YEAR, CALENDARMEMO_MONTH, CALENDARMEMO_DAY, CALENDARMEMO_CONTENTS) VALUES (";
   sql+= request.getParameter("memoYear");
   sql+= ", ";
   sql+= request.getParameter("memoMonth");
   sql+= ", ";
   sql+= request.getParameter("memoDay");
   sql+= ", \'";
   sql+= request.getParameter("memoContents");
   sql+= " \')";
   
   // INSERT INTO jdbc_testVALUES (‘홍길동’, ‘test@test.net’)
     
   int r = stmt.executeUpdate(sql);
   
   if(r==1){
   out.println("1개 데이터 추가 성공");
   }
 //  }
/*select 문장을문자열형태로구성한다.
  String sql= "SELECT username, email FROM jdbc_test";
  pstmt= conn.prepareStatement(sql);
  // select 를수행하면데이터정보가ResultSet클래스의인스턴스로리턴
  ResultSet rs= pstmt.executeQuery();
  int i= 1;
  // 마지막데이터까지반복함.
  while (rs.next()) {
  out.print(i+ " : " + rs.getString(1) + " , ");
  out.println(rs.getString("email") + "<BR>");
  i++;
  }
  rs.close();*/
  %>
  <HR>
  </center>
</body>
</html>
   <%
        //사용한 자원을 반납한다.
       stmt.close();
       conn.close();
   %>