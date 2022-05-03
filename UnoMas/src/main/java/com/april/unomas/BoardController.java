package com.april.unomas;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.PagingVO;
import com.april.unomas.service.BoardService;
import com.april.unomas.service.NoticeService;

@Controller
public class BoardController {

	private static final Logger log 
		= LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@Inject
	private NoticeService nService;
	
	// customerCenter
//	@RequestMapping(value = "/contact")
//	public String contact() {
//		return "/customerCenter/contact";
//	}
	
	@GetMapping(value = "/qni_write")
	public String boardWriteGET() throws Exception{
		log.info("registGET() 호출 -> /board/qni_write.jsp 이동");
		
		return "/board/qni_write";
	}
	
	// 글쓰기  /board/regist  (post)
	@PostMapping(value = "/qni_write")
	public String boardWritePOST(BoardVO vo, HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		log.info("boardWritePOST() 호출");
		
		// 전달된 정보를 저장
		
		// 서비스 - 글쓰기 동작 수행
		service.boardWrite(vo);
		
		// 페이지 이동(/board/list)
		return "redirect:/qni";
	}
	
	// 글목록  /board/listAll  (GET)
	@GetMapping(value = "/qni")
	public String listAllGET(Model model) throws Exception {
		log.info("listAllGET() 호출");
		
		// 서비스 -디비에 저장된 글정보 가져오기
		List<BoardVO> boardList = service.listAll();
		
		log.info(boardList+"");
		
		// view 페이지로 데이터를 전달
		model.addAttribute("boardList",boardList);
//		model.addAttribute("boardList",service.listAll());
		
		// /board/listAll.jsp 페이지이동
		return "/board/qni";
	}
	
	@GetMapping(value = "/faq")
	public String faq(Model model) throws Exception {
		
//		 서비스 -디비에 저장된 글정보 가져오기
		List<NoticeVO> boardList = nService.listAll();
		
		log.info(boardList+"");
		
//		 view 페이지로 데이터를 전달
		model.addAttribute("boardList",boardList);
//		model.addAttribute("boardList",service.listAll());
		
		return "/board/faq";
	}
	
	@GetMapping(value = "/faq_insert")
	public String noticeWriteGET() throws Exception{
		
		return "/board/faq_insert";
	}
	
	@PostMapping(value = "/faq_insert")
	public String noticeWritePOST(NoticeVO vo, HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		log.info("noticeWritePOST() 호출");
		
		// 전달된 정보를 저장
		
		// 서비스 - 글쓰기 동작 수행
		nService.noticeWrite(vo);
		
		// 페이지 이동(/board/list)
		return "redirect:/faq";
	}
	
	@GetMapping(value = "/faq_detail")
	public String noticeInfoGET(@RequestParam("notice_num") int notice_num,Model model) throws Exception{
		log.info(notice_num+"");
		
		nService.rCountUp(notice_num);
		model.addAttribute("vo",nService.getNotice(notice_num));
		
		return "/board/faq_detail";
	}
	
	@GetMapping(value = "/qni_sort")
	public String sortListGET(@RequestParam("faq_cate") String faq_cate, Model model) throws Exception { 
		log.info(faq_cate);
		
		List<BoardVO> boardList = service.sortCate(faq_cate);
		
		log.info(boardList+"");
		
		model.addAttribute("boardList",boardList);
		
		return "/board/qni_sort";
	}
	
	@GetMapping(value="/qni_paging")
	public String pagingListGET(Criter cri,Model model) throws Exception {
	        
	    PagingVO pagingVO = new PagingVO(); 
	    pagingVO.setCri(cri);
	    log.info(pagingVO+"");
//	    pagingVO.setTotalCount(100);
	    pagingVO.setTotalCount(service.countBoardTotal());
	    List<BoardVO> pList = service.selectBoardList(cri);
	    model.addAttribute("pList", pList);
	    model.addAttribute("pagingVO", pagingVO);
	        
	    return "/board/qni_paging";
	        
	}
	
	@GetMapping(value="/qni_update")
	public String updateBoardGET(@RequestParam("faq_num") int faq_num, Model model) throws Exception {
		
		BoardVO vo = service.getBoard(faq_num);
		
		model.addAttribute("vo",vo);
		
		return "/board/qni_update";
	}
	
	@PostMapping(value="/qni_update")
	public String updateBoardPOST(BoardVO vo) throws Exception {
		log.info("수정할 정보 : " + vo);
		service.updateBoard(vo);
		
		
		
		return "redirect:/qni_paging";
	}
	
	@GetMapping(value="/qni_delete")
	public String deleteBoard(@RequestParam("faq_num") int faq_num) throws Exception {
		
		service.deleteBoard(faq_num);
		
		return "redirect:/qni_paging";
	}

}
