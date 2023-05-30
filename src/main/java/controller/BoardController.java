package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.ShopService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private ShopService service;

	@GetMapping("*")
	public ModelAndView write() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Board());
		return mav;
	}
	/*
	 * 1.유효성 검증
	 * 2.db의 board 테이블에 내용 저장, 파일 업로드
	 * 3.등록 성공 : list 재요청
	 * 	 등록 실패 : write 재요청
	 */
	@PostMapping("write")
	public ModelAndView writePost(@Valid Board board, BindingResult bresult,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		String boardid=(String)request.getSession().getAttribute("boardid");
		if(boardid==null) boardid="1";
		request.getSession().setAttribute("boardid", boardid);
		board.setBoardid(boardid);
		service.boardWrite(board,request);
		mav.setViewName("redirect:list?boardid="+boardid);
		return mav;
	}
	
	/*
	 * @RequestParam : 파라미터값을 객체를 매핑하여 저장하는 기능
	 *  파라미터값 저장
	 *  	1. 파라미터이름과 매개변수이름이 같은 경우
	 *  	2. Bean 클래스 객체의 프로퍼티이름과 파라미터이름이 같은 경우
	 *  	3. Map 객체를 이용하는 경우 <= 이방식 사용
	 *  
	 *  검색 기능 추가
	 */
	@RequestMapping("list")
	public ModelAndView list(@RequestParam Map<String,String> param, HttpSession session) {
//	public ModelAndView list(Integer pageNum, String boardid, HttpSession session) {
		System.out.println(param);
		Integer pageNum = null;
		if(param.get("pageNum") != null)
			pageNum = Integer.parseInt(param.get("pageNum"));
		String boardid = param.get("boardid");
		
		
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		} 
		if(boardid == null || boardid.equals("")) {
			boardid = "1";
		}
		session.setAttribute("boardid", boardid);
		String boardName = null;
		switch(boardid) {
			case "1" : boardName = "공지사항"; break;
			case "2" : boardName = "자유게시판"; break;
			case "3" : boardName = "QNA"; break;
		}
		int limit = 10; // 한페이지에 보여줄 게시물 건수
		int listcount = service.boardcount(boardid); // 등록 게시물 건수
		// boardlist :  현재페이지에 보여줄 게시물 목록
		List<Board> boardlist = service.boardlist(pageNum,limit,boardid);
		
		//페이징 처리를 위한 값
		int maxpage = (int)((double)listcount/limit + 0.95); //등록 건수에 따른 최대 페이지 
		int startpage = (int)((pageNum/10.0 + 0.9) - 1) * 10 +1; // 페이지의 시작 번호
		int endpage = startpage + 9;							 // 페이지의 끝 번호
		if(endpage > maxpage) endpage = maxpage;				 // 페이지의 끝 번호는 최대페이지보다 클수없다.
		int boardno = listcount - (pageNum - 1) * limit;		 // 화면에 보여지는 게시물 번호
		String today = new SimpleDateFormat("yyyyMMdd").format(new Date()); //오늘 날짜를 문자열로 저장
		mav.addObject("boardid",boardid);
		mav.addObject("boardName",boardName);
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("boardlist",boardlist);
		mav.addObject("boardno",boardno);
		mav.addObject("today",today);
		return mav;
	}
	
	@RequestMapping("detail")
	public ModelAndView detail(Integer num) {
		ModelAndView mav = new ModelAndView();
		Board board = service.getBoard(num);
		service.addreadCnt(num);
		mav.addObject("board",board);
		if(board.getBoardid() == null || board.getBoardid().equals("1"))
			mav.addObject("boardName","공지사항");
		else if(board.getBoardid().equals("2"))
			mav.addObject("boardName","자유게시판");
		else if(board.getBoardid().equals("3"))
			mav.addObject("boardName","QNA");
		return mav;
	}
}
