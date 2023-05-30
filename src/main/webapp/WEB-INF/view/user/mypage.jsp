<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /shop1/src/main/webapp/WEB-INF/view/user/mypage.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script type="text/javascript">
   $(function(){
	   $("#minfo").show() //id=minfo인 태그 내용 보여줌 => 회원정보
	   $("#oinfo").hide() //id=oinfo인 태그 내용 안보여줌 => 주문정보
	   //class="saleLine" 모든 태그 => 주문상품조회부분
	   $(".saleLine").each(function(){  
		   $(this).hide()   //안보이도록함
	   })
	   $("#tab1").addClass("select") //select class 속성 추가 
   })
   function disp_div(id,tab) {
	   $(".info").each(function() {
		   $(this).hide()
	   })
	   $(".tab").each(function() {
		   $(this).removeClass("select")
	   })
	   $("#"+id).show()
	   $("#"+tab).addClass("select")
   }
   function list_disp(id) {  //id=saleLine0,saleLine1....
	   $("#"+id).toggle()  //현재 보이는 경우 => 안보이도록
	                       //현재 안보이는 경우 => 보이도록
   }
</script>
<style type="text/css">
  .select {
     padding:3px;
     background-color: #0000ff;
  }
  .select>a {
     color : #ffffff;
     text-decoration: none;
     font-weight: bold;
  }
  .title { 
     text-decoration: none;
  }
</style>
</head>
<%--
   http://localhost:8080/shop1/user/mypage?userid=id명
   mypage 완성하기
   파라미터 : userid
   salelist : userid가 주문한 전체 Sale 객체 목록.(List)
   user     : userid에 해당하는 회원정보
 --%>
<body>
<table class="w3-table-all">
  <tr><td id="tab1" class="tab">
  <a href="javascript:disp_div('minfo','tab1')" class="title">회원정보</a></td>
   <c:if test="${param.userid != 'admin'}">
     <td id="tab2" class="tab">
         <a href="javascript:disp_div('oinfo','tab2')"  class="title">주문정보</a></td>
   </c:if></tr></table>
<div id="oinfo" class="info" style="display:none; width:100%;">
<table  class="w3-table-all"><tr><th>주문번호</th><th>주문일자</th><th>주문금액</th></tr>
<c:forEach items="${salelist}" var="sale" varStatus="stat">
<tr><td align="center">
<a href="javascript:list_disp('saleLine${stat.index}')">${sale.saleid}</a></td>
<td align="center"><fmt:formatDate value="${sale.saledate}" 
        pattern="yyyy-MM-dd"/></td>
<td align="right"><fmt:formatNumber value="${sale.total}" pattern="###,###" />원
</td></tr>
<tr id="saleLine${stat.index}" class="saleLine">
 <td colspan="3" align="center">
   <table  class="w3-table-all"><tr><td>상품명</td><td>상품가격</td><td>주문수량</td><td>상품총액</td></tr>
   <c:forEach items="${sale.itemList }" var="saleItem">
   <tr><td class="title">${saleItem.item.name}</td>
       <td><fmt:formatNumber value="${saleItem.item.price}" pattern="###,###"/>
       원</td>
       <td>${saleItem.quantity}</td>
       <td><fmt:formatNumber value="${saleItem.item.price * saleItem.quantity}"
        pattern="###,###"/></td></tr>
   </c:forEach></table>
 </td></tr></c:forEach></table></div>
 <div id="minfo" class="info">
 <table  class="w3-table-all">
   <tr><td>아이디</td><td>${user.userid}</td></tr>
   <tr><td>이름</td><td>${user.username}</td></tr>   
   <tr><td>우편번호</td><td>${user.postcode}</td></tr>   
   <tr><td>전화번호</td><td>${user.phoneno}</td></tr>   
   <tr><td>이메일</td><td>${user.email}</td></tr>   
   <tr><td>생년월일</td>
   <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td></tr>   
 </table><br>
 <a href="update?userid=${user.userid}">[회원정보수정]</a>&nbsp;
 <a href="password">[비밀번호수정]</a>&nbsp;
 <c:if test="${loginUser.userid != 'admin'}">
 <a href="delete?userid=${user.userid}">[회원탈퇴]</a>&nbsp;
 </c:if>
 <c:if test="${loginUser.userid == 'admin'}">
 <a href="../admin/list">[회원목록]</a>&nbsp;
 </c:if> 
 </div></body></html>