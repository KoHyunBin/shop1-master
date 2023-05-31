package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import exception.LoginException;
import logic.User;

public class BoardInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle // /board/write 요청시 => controller.BoardController.write() 호출
	(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String boardid = (String)session.getAttribute("boardid");
		User login = (User)session.getAttribute("loginUser");
		if(boardid == null || boardid.equals("1")) { //공지사항 글작성
			if(login == null || !login.getUserid().equals("admin")) { //로그인 정보 확인
				String msg = "관리자만 등록 가능합니다.";
				String url = request.getContextPath() +  "/board/list?boardid=" + boardid;
				throw new LoginException(msg,url);
			}
		}
	return true; //다음 메서드 호출 가능
	}
	
}
