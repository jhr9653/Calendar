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
 <!--  
 /* *
	*
	* @brief 	메모추가 소스
	*
	* @author 	윤상혁
	* @date 	2019-10-09
	*
	* @param 	action
	*
	* @remark	DB연동소스 및 메모추가하는 jsp파일. 메모추가시 Calendar.jsp에 반영되며 연동해놓은 mysqldb에 저장됨. [2019-10-09; 윤상혁] \n
	*
	*/ -->
	
	
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
   <input type=submit value="추가"><br><br><br>
  </form>
   <%
   Statement stmt = conn.createStatement();
   String sql= "delete from CALENDARMEMO where CALENDARMEMO_CONTENTS=?";

   
   
   // int dataplus = stmt.executeUpdate(sql);
   
   // if(dataplus==1){
   // out.println("1개 데이터 추가 성공");
   // }
   
   // 위의 쿼리는 메모넣기에 성공했을 시 1개 데이터 추가 성공 이라는 문구가 뜨도록 하는 것인데, 오류때문에 작동이 안됨.
  %>
  <HR>
  </center>
</body>
</html>
   <%
        //DB 자원 반납.
       stmt.close();
       conn.close();
   %>