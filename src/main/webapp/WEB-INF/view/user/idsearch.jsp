<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%-- /shop1/src/main/webapp/WEB-INF/view/user/idsearch.jsp 
     1. sitemesh 대상페이지 아님
     2. idsearch, pwsearch를 하나의 controller에서 구현 --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %> 
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head><body>
<h3>아이디찾기</h3>
<form:form  modelAttribute="user"  action="idsearch" method="post">
  <spring:hasBindErrors name="user">
    <font color="red"><c:forEach items="${errors.globalErrors}" var="error">
         <spring:message code="${error.code}" />
      </c:forEach></font></spring:hasBindErrors>
<table class="w3-table"><tr><th>이메일</th><td><input type="text" name="email" class="w3-input">
     <font color="red"><form:errors path="email" /></font></td></tr>
 <tr><th>전화번호</th><td><input type="text" name="phoneno"  class="w3-input">
 <font color="red"><form:errors path="phoneno" /></font></td></tr>
 <tr><td colspan="2" class="w3-center">
 <input type="submit" value="아이디찾기" class="w3-btn w3-blue"></td></tr></table>
</form:form></body></html>