<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%
  //DB 연결 소스
    
  PreparedStatement pstmt = null;
  String driverName="com.mysql.jdbc.Driver";
  String url = "jdbc:mysql://localhost:3306/Calendar?serverTimezone=UTC";
  String id = "Calendar";
  String pwd ="1234";
  request.setCharacterEncoding("utf-8");
 
	  Class.forName(driverName);
	  Connection conn = DriverManager.getConnection(url,id,pwd);
	  if (conn== null) {
	   out.println("Connection Failed.");
	  } 
  %>
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	  <title>일정 확인 프로그램</title>
 </head>
 <body>
  <%
  java.util.Calendar cal=java.util.Calendar.getInstance(); //Calendar객체 cal생성
  
  //현재 날짜 입력
  
  int currentYear=cal.get(java.util.Calendar.YEAR); 
  int currentMonth=cal.get(java.util.Calendar.MONTH);
  int currentDate=cal.get(java.util.Calendar.DATE);
  
  //표현하고자 할 날짜 입력
  
  String Year=request.getParameter("year");
  String Month=request.getParameter("month");
  int year, month;
  if(Year == null && Month == null){ //처음 호출했을 때
  year=currentYear;
  month=currentMonth;
  }
  
  else { //표현하고자 할 날짜를 숫자로 변환하여 입력시킴
   year=Integer.parseInt(Year);
   month=Integer.parseInt(Month);
   
   // 1월~12월 범위 지정.
   
   if(month<0){
	   month=11; year=year-1;
	   } 
   if(month>11){
	   month=0; year=year+1;
	   }
  }
  %>
  <center>
  
  <table border=0>
  
   <tr>
   
    <td align=left width=200> <!-- 년 도-->
    <a href="calendar.jsp?year=<%out.print(year-1);%>&month=<%out.print(month);%>">◀</a>
    <% out.print(year); %>년
    <a href="calendar.jsp?year=<%out.print(year+1);%>&month=<%out.print(month);%>">▶</a>
    </td>
    
    <td align=center width=300> <!-- 월 -->
    <a href="calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month-1);%>">◀</a>
    <% out.print(month+1); %>월
    <a href="calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month+1);%>">▶</a>
    </td>
    
    <td align=right width=200><% out.print(currentYear + "-" + (currentMonth+1) + "-" + currentDate); %>
    </td>
    
   </tr>
   
  </table>
  
  <table border=2 cellspacing=0> <!-- 달력 부분 -->
  
   <tr width=100 bgcolor=#DDE7E7>
   
    <td width=150>일</td> <!-- 일=1 -->
    <td width=150>월</td> <!-- 월=2 -->
    <td width=150>화</td> <!-- 화=3 -->
    <td width=150>수</td> <!-- 수=4 -->
    <td width=150>목</td> <!-- 목=5 -->
    <td width=150>금</td> <!-- 금=6 -->
    <td width=150>토</td> <!-- 토=7 -->
    
   </tr>
   
   <tr height=100 bgcolor=#E7E6D2>
   
   <%
   cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
   int startDay=cal.get(java.util.Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
   int end=cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
   int br=0; //7일마다 줄 바꾸기
   for(int i=0; i<(startDay-1); i++) { //빈칸출력
    out.println("<td>&nbsp;</td>");
    br++;
    if((br%7)==0) {
     out.println("<br>");
    }
   }
   for(int i=1; i<=end; i++) { //날짜출력
    out.println("<td>" + i + "<br>");
      //일정 추가
      int memoyear, memomonth, memoday;
      try{
        // select 문장을 문자열 형태로 구성한다.
       String sql= "SELECT CALENDARMEMO_YEAR, CALENDARMEMO_MONTH, CALENDARMEMO_DAY, CALENDARMEMO_CONTENTS FROM CALENDARMEMO";
       pstmt= conn.prepareStatement(sql);
        // select 를 수행하면 데이터 정보가 ResultSet 클래스의 인스턴스로 리턴
       ResultSet rs= pstmt.executeQuery();
       while (rs.next()) { // 마지막 데이터까지 반복함.
        //날짜가 같으면 데이터 출력
        memoyear=rs.getInt("CALENDARMEMO_YEAR");
        memomonth=rs.getInt("CALENDARMEMO_MONTH");
        memoday=rs.getInt("CALENDARMEMO_DAY");
        if(year==memoyear && month+1==memomonth && i==memoday) {
         out.println(rs.getString("CALENDARMEMO_CONTENTS")+"<br>"); 
        }
       }
       rs.close();
      }
      catch(Exception e) {
       System.out.println(e);
      };
    out.println("</td>");
    br++;
    if((br%7)==0 && i!=end) {
     out.println("</tr><tr height=100 bgcolor=#E7E6D2>");
    }
   }
   while((br++)%7!=0) //말일 이후 빈칸출력
    out.println("<td>&nbsp;</td>");
   %>
   
   </tr>
   
  </table>
  
  </center>
  
 </body>
 
</html>


   <%
        //DB 자원 반납.
       pstmt.close();
       conn.close();
   %>