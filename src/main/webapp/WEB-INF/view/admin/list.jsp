<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /shop1/src/main/webapp/WEB-INF/view/admin/list.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<script type="text/javascript">
   function allchkbox(allchk) {
	   //prop() : 속성등록,조회 jquery함수
	   // class="idchks" 인 태그들 속성의 checked=allchk태그의checked 값으로 변경 
	   $(".idchks").prop("checked",allchk.checked)
   }
</script>
<style>
   .noline { text-decoration: none;}
</style>
</head>
<body>
<h2>회원목록</h2>
<form action="mailForm" method="post">
  <table class="w3-table-all">
  <%-- list?sort=10 : 아이디의 오름차순 정렬
       list?sort=11 : 아이디의 내림차순 정렬 
  --%>
  <tr><th>아이디<a href="list?sort=10" class="noline">▲</a><%--ㅁ한자 --%>
              <a href="list?sort=11" class="noline">▼</a></th>
      <th>이름<a href="list?sort=20" class="noline">▲</a><%--ㅁ한자 --%>
              <a href="list?sort=21" class="noline">▼</a></th>
      <th>전화<a href="list?sort=30" class="noline">▲</a><%--ㅁ한자 --%>
              <a href="list?sort=31" class="noline">▼</a></th>
      <th>생일<a href="list?sort=40" class="noline">▲</a><%--ㅁ한자 --%>
              <a href="list?sort=41" class="noline">▼</a></th>
      <th>이메일<a href="list?sort=50" class="noline">▲</a><%--ㅁ한자 --%>
              <a href="list?sort=51" class="noline">▼</a></th><th></th>
  <th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th></tr>
  <c:forEach items="${list}" var="user">
  <tr><td>${user.userid}</td><td>${user.username}</td><td>${user.phoneno}</td>
  <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" /></td>
  <td>${user.email}</td><td>
  <a href="../user/update?userid=${user.userid}">수정</a>
  <a href="../user/delete?userid=${user.userid}">강제탈퇴</a>
  <a href="../user/mypage?userid=${user.userid}">회원정보</a></td>
  <td><input type="checkbox" name="idchks" class="idchks" value="${user.userid}"></td></tr>
  </c:forEach>
  <tr><td colspan="7" class="w3-center"><input type="submit" value="메일보내기"></td></tr>
  </table></form></body></html>