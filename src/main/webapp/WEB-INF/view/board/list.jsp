<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /shop1/src/main/webapp/WEB-INF/view/board/list.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${boardName}</title>
<script>
	function listpage(page){
		document.searchform.pageNum.value=page;
		document.searchform.sumbit();
	}
</script>
</head>
<body>
<h2>${boardName}</h2>
<table class="w3-table w3-border">
<form action="list" method="post" name="searchform">
	<tr>
		<td>
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="boardid" value="${param.boardid}">
			<select name="searchtype" class="w3-select">
				<option value="">선택하세요</option>
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="content">내용</option>
				<script>
					searchform.searchtype.value="${param.searchtype}";
				</script>
			</select>
		</td>
		<td colspan="3">
			<input type="text" name="searchcontent" value="${param.searchcontent}" class="w3-input">
		</td>
		<td>
			<input type="submit" value="검색" class="w3-btn w3-blue">
			<input type="button" value="전체게시물보기" class="w3-btn w3-blue" onclick="location.href='list?boardid=${boardid}'">
		</td>
</form>
	</tr>
	<c:if test="${listcount > 0 }"> <!-- 등록된 게시물 건수 -->
		<tr>
			<td colspan="5" class="w3-right-align">글개수:${listcount}</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${boardlist}">
			<tr>
				<td>${boardno}</td> <%-- 화면 보여지는 게시물 번호 --%>
				<c:set var="boardno" value="${boardno - 1}"/>
				<td class="w3-left">
				<c:if test="${! empty board.fileurl}">
					<a href="file/${board.fileurl}">@</a>
				</c:if>
				<c:if test="${empty board.fileurl}">&nbsp;&nbsp;&nbsp;</c:if>
				<c:forEach begin="1" end="${board.grplevel}">&nbsp;&nbsp;&nbsp;</c:forEach>
				<c:if test="${board.grplevel > 0}">└</c:if>
				<a href="detail?num=${board.num}">${board.title}</a>
				</td>
				<td>${board.writer}</td>
				<td>
					<fmt:formatDate value="${board.regdate}" pattern="yyyyMMdd" var="rdate"/>
					<c:if test="${today == rdate}">
						<fmt:formatDate value="${board.regdate}" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${today != rdate}">
						<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm"/>
					</c:if>
				</td>
				<td>${board.readcnt}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" class="w3-center">
			<c:if test="${pageNum > 1 }">
				<a href="javascript:listpage('${pageNum - 1}')">[이전]</a>
			</c:if>
			<c:if test="${pageNum <= 1}">[이전]</c:if>
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == pageNum}">[${a}]</c:if>
				<c:if test="${a != pageNum}">
					<a href="javascript:listpage('${a}')">[${a}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageNum < maxpage}">
				<a href="javascript:listpage('${pageNum +1}')">[다음]</a>
			</c:if>
			<c:if test="${pageNum >= maxpage}">[다음]</c:if>
			</td>
		</tr>
	</c:if> <%-- 등록된 게시물이 있는 경우 끝 --%>
	<c:if test="${listcount == 0 }">
		<tr>
			<td colspan="5">등록된 게시물이 없습니다.</td>
		</tr>
	</c:if> 
	<tr>
		<td colspan="5">
			<a href="write" class="w3-right">[글 쓰기]</a>
		</td>
	</tr>
</table>
</body>
</html>