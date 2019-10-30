<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 오류 페이지 정의  -->
<%@ page errorPage="board_error.jsp" %>

<!-- taglib 지시어  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 조회</title>

	<link rel="stylesheet" href="board.css" type="text/css" media="screen" />

	<script type="text/javascript">
	
	var today = new Date(); // 오늘 날짜//지신의 컴퓨터를 기준으로
	//today 에 Date객체를 넣어줌 //ex)5일  
	function prevCalendar() {
	 
	 
	 today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	 buildCalendar(); // 현재 달 
	}
	 
	function nextCalendar() {
	 
	 
	 today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	 buildCalendar();
	}
	 
	function buildCalendar() {// 현재 달fur
	 var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
	 var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날
	 var tblCalendar = document.getElementById("calendar");     // 테이블 달력을 만들 테이블
	 var tblCalendarYM = document.getElementById("calendarYM");    // yyyy년 m월 출력할 곳
	 tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";  // yyyy년 m월 출력
	// 기존 테이블에 뿌려진 줄, 칸 삭제
	 
	 
	 while (tblCalendar.rows.length > 2) {
	  tblCalendar.deleteRow(tblCalendar.rows.length - 1);
	 }
	 var row = null;
	 row = tblCalendar.insertRow();
	 var cnt = 0;
	// 1일이 시작되는 칸을 맞추어 줌
	 for (i=0; i<nMonth.getDay(); i++) {
	  cell = row.insertCell();
	  cnt = cnt + 1;
	 }
	 
	 for (i=1; i<=lastDate.getDate(); i++) { 
	  cell = row.insertCell();
	  cell.innerHTML = i+"zzz";
	  cnt = cnt + 1;
	  if (cnt%7 == 0)// 1주일이 7일 이므로
	   row = calendar.insertRow();// 줄 추가
	 }
	 
	}
		function retrivalcheck() {
			
			// get방식
			// document.location.href="addr_control.jsp?action=list";
			
			// post방식 디펄트가 list
			document.form1.action.value="list";
			document.form1.submit();
	
			
		}
	
		function addcheck() {
			
			// post방식
			document.form1.action.value="add";
			document.form1.submit();
		}
		
		function editcheck(id) {
		
			// get방식
			// document.location.href="addr_control.jsp?action=edit&id="+id;
			
			// post방식
			document.form1.action.value="edit";
			document.form1.id.value=id;
			document.form1.submit();
	
			
		}
	</script>

</head>

<body>
	<div align=center>
	<H2>게시판 조회</H2>
	<HR>
	
	
	<table id="calendar" boarder="3" align="center">
 <tr>
     <td><label onclick="prevCalendar()"><</label></td>
        <td colspan="5" align="center" id="calendarYM">yyyy년 m월</td>
        <td><label onclick="nextCalendar()">>
           
        </label></td>
    </tr>
    <tr>
     <td align="center">일</td>
     <td align="center">월</td>
     <td align="center">화</td>
     <td align="center">수</td>
     <td align="center">목</td>
     <td align="center">금</td>
     <td align="center">토</td>
   </tr>
 
 
</table>
<script language="javascript" type="text/javascript">
buildCalendar();
</script>
	<!-- 게시판 목록 조회폼 -->
	<!-- action의 실제 URL은 앞에 컨텍스트 Path와 jsp의 패키지가 추가됨 -->
<!--
	<form name="form1" method="post" action="/board/boardB/BoardController">
 -->
	<form name="form1" method="post" action="BoardController">

		<input type="hidden" name="action" value="list">
		<input type="hidden" name="id" value=0>
	
		<table border=1>
			<tr>
				<td colspan=4 align=right>
					<input type="button" value="추가" onClick="addcheck()">				
    				<input type="button" value="조회" onClick="retrivalcheck()">
				</td>
			</tr>
			<tr>
				<th>ID</th>
				<th>성명</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
			
			<c:forEach var="i" items="${boardList}">
				<tr>
					<td><a href="javascript:editcheck(${i.id})">${i.id}</a></td>
					<td>${i.userName}</td>
					<td>${i.title}</td>
					<td>${i.content}</td>
				</tr>
			</c:forEach>			
			
			</table>
		</form>
	</div>
</body>

</html>