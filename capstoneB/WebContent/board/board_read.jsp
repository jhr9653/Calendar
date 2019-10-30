<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page errorPage="board_error.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 등록</title>
	<link rel="stylesheet" href="board.css" type="text/css" media="screen" />

	<script type="text/javascript">

	function editcheck(id) {
		

		document.form1.action.value="edit";
		document.form1.id.value=id;
		document.form1.submit();

		
	}
	
function listcheck() {
		

		document.form1.action.value="list";
		document.form1.submit();

		
	}
	
	
	</script>

</head>

  
<body>
	<div align="center">

	

	<form name="form1" method="post" action="BoardController">
	
		
		<input type="hidden" name="action" value=${action}>
		<input type="hidden" name="id" value=${boardDTO.id}>
		
		<div class="bodytext_area box_inner">			
			<ul class="bbsview_list">
				<li class="bbs_title">제목 :${boardDTO.title}</li>
				<li class="bbs_hit">작성자:${boardDTO.user}</li>
				<li class="bbs_date">날짜:${boardDTO.date}</li>
				<li class="bbs_content">
					<div class="editer_content">
						${boardDTO.content}
					</div>
				</li>
			</ul>
		</div>
<input type="button" id="update" value="수정" onClick="editcheck(${boardDTO.id})">
<input type="button" id="update" value="목록" onClick="listcheck()">


	</form>
	</div>

</body>
</html>