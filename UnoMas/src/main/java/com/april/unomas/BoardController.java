package com.april.unomas;

import java.util.List;

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
import com.april.unomas.domain.NoticeVO;
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
		log.info("registGET() 호출 -> /customerCenter/qni_write.jsp 이동");
		
		return "/customerCenter/qni_write";
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
		return "/customerCenter/qni";
	}
	
	@GetMapping(value = "/faq")
	public String faq(Model model) throws Exception {
		
//		 서비스 -디비에 저장된 글정보 가져오기
		List<NoticeVO> boardList = nService.listAll();
		
		log.info(boardList+"");
		
//		 view 페이지로 데이터를 전달
		model.addAttribute("boardList",boardList);
//		model.addAttribute("boardList",service.listAll());
		
		return "/customerCenter/faq";
	}
	
	@GetMapping(value = "/faq_insert")
	public String noticeWriteGET() throws Exception{
		
		return "/customerCenter/faq_insert";
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
		
		model.addAttribute("vo",nService.getNotice(notice_num));
		
		return "/customerCenter/faq_detail";
	}
	
}
