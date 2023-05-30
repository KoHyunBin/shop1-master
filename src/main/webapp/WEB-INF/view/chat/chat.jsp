<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /shop1/src/main/webapp/WEB-INF/view/chat/chat.jsp --%>    
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="port" value="${pageContext.request.localPort}" /><%-- 포트번호 :  8080 --%>
<c:set var="server" value="${pageContext.request.serverName}" /><%-- IP주소 : localhost --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>websocket client</title>
<script type="text/javascript">
   $(function(){
	   let ws = new WebSocket("ws://${server}:${port}${path}/chatting")
	   ws.onopen = function() { //서버 접속
		  $("#chatStatus").text("info:connection opened") 
		  $("input[name=chatInput]").on("keydown",function(evt){
			  if(evt.keyCode == 13) { //enter key
				  let msg = $("input[name=chatInput]").val()
				  ws.send(msg) //서버로 데이터 전송
				  $("input[name=chatInput]").val("")
			  }
		  })
	   }
	   //서버에서 메세지를 수신한 경우
	   ws.onmessage = function(event) {
		   //event.data : 수신된 메세지 정보
		   //prepend(데이터) : 앞쪽에 추가
		   //append(데이터) : 뒤쪽에 추가
		   $("textarea").eq(0).prepend(event.data+"\n")
	   }
	   //서버와 접속 종료 
	   ws.onclose = function(event){
		   $("#chatStatus").text("info:connection close")
	   }
   })
</script></head>
<body>
<p><div id="chatStatus"></div>
<textarea name="chatMsg" rows="15" cols="40" class="w3-input"></textarea><br>
메시지입력:<input type="text" name="chatInput" class="w3-input">
</body></html>