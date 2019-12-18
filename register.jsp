<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="board_error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script>
	function create()
	{
		document.mainform.action.value = "create";
		document.mainform.submit();
	}
</script>
</head>
<body>
	<form name="mainform" method="post" action="BoardController">
		<input type="hidden" name="action" value="create">
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
				<td colspan="2"><button id="create" onclick="create()">회원가입</button></td>
			</tr>
		</table>
	</form>
</body>
</html>