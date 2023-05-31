<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /shop1/src/main/webapp/WEB-INF/view/board/reply.jsp -->
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 답글 쓰기</title>
</head>
<body>
<form:form modelAttribute="board" action="reply" method="post" name="f">
	<form:hidden path="num"/>	<form:hidden path="boardid"/>
	<form:hidden path="grp"/>	<form:hidden path="grplevel"/>
	<form:hidden path="grpstep"/>
	<h2>${boardName} 답글 등록</h2>
	<table class="w3-table">
		<tr>
			<td>글쓴이</td>
			<td>
				<input type="text" name="writer">
				<font color="red"><form:errors path="writer"/></font>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<form:password path="pass"/>
				<font color="red"><form:errors path="pass"/></font>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<form:input path="title" value="RE:${board.title}"/>
				<font color="red"><form:errors path="title"/></font>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" rows="15" cols="80"></textarea>
				<font color="red"><form:errors path="content"/></font>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("content", {
				filebrowerImageUploadUrl : "imgupload" });
		</script>
		<tr>
			<td colspan="2">
				<a href="javascript:document.f.submit()">[답변글등록]</a>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>