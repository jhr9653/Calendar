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

		// window.load는 페이지 로딩 후 실행
		window.onload = function() {
			var action = document.form1.action.value;

			if(action=="edit") {
				document.getElementById("insert").disabled=true;

			} else if(action=="add") {

				document.getElementById("update").disabled=true;
				document.getElementById("delete").disabled=true;
			}
		} 
	
		function insertcheck() {
			document.form1.action.value="insert";
			document.form1.submit();
		}
	
		function updatecheck() {

			document.form1.action.value="update";
			document.form1.submit();
		}
	
		function deletecheck() {
			result = confirm("정말로 삭제하시겠습니까 ?");
		
			if(result == true){
				

				document.form1.action.value="delete";
				document.form1.submit();
			}
			else
				return;
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
				<li class="bbs_title">제목 :<input type=text size=20 name=title value=${boardDTO.title}></li>
				<li class="bbs_hit">작성자:<input type=text size=20 name=user value=${boardDTO.user}></li>
				<li class="bbs_date">날짜:<input type=date size=20 name=date value=${boardDTO.date}></li>
								<li class="bbs_content">내용:
					<div class="editer_content">
						<textarea name="content" cols="40" rows="8" value=${boardDTO.content}>${boardDTO.content} </textarea>
					</div>
				</li>
			</ul>
		</div>
					<input type="button" id="insert" value="입력" onClick="insertcheck()">
					<input type="button" id="update" value="수정" onClick="updatecheck()">
					<input type="button" id="delete" value="삭제" onClick="deletecheck()">

	</form>
	</div>

</body>
</html>