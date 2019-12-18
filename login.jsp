<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="board_error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script>
	window.onload = function ()
	{
		if (document.mainform.status.value == "result")
		{
			if (document.mainform.result.value == "true")
			{
				alert("로그인에 성공했습니다.");
			}
			else
			{
				alert("로그인에 실패했습니다.");
			}
			window.location.href = "BoardController?action=list";
		}
	}
	function check()
	{
		document.mainform.action.value = "check";
		document.mainform.submit();
	}
</script>
</head>
<body>
	<form name="mainform" method="post" action="BoardController">
		<input type="hidden" name="status" value="${login_status}">
		<input type="hidden" name="result" value="${login_result}">
		<input type="hidden" name="action" value="check">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id="pw"></td>
			</tr>
			<tr>
				<td colspan="2"><button id="check" onclick="check()">로그인</button></td>
			</tr>
		</table>
	</form>
</body>
</html>