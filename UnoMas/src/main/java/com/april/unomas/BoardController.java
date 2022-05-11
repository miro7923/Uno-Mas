package com.april.unomas;

import java.util.HashMap;
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
import com.april.unomas.domain.QnaCateVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.service.BoardService;
import com.april.unomas.service.NoticeService;
import com.april.unomas.service.QnaService;

@Controller
public class BoardController {

	private static final Logger log 
		= LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@Inject
	private NoticeService nService;
	
	@Inject
	private QnaService qService;
	
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
		return "redirect:/qni_paging";
	}
	
	// 글목록  /board/listAll  (GET)
	/*
	 * @GetMapping(value = "/qni") public String listAllGET(Model model) throws
	 * Exception { log.info("listAllGET() 호출");
	 * 
	 * // 서비스 -디비에 저장된 글정보 가져오기 List<BoardVO> boardList = service.listAll();
	 * 
	 * log.info(boardList+"");
	 * 
	 * // view 페이지로 데이터를 전달 model.addAttribute("boardList",boardList); //
	 * model.addAttribute("boardList",service.listAll());
	 * 
	 * // /board/listAll.jsp 페이지이동 return "/board/qni"; }
	 */
	
	/*@GetMapping(value = "/faq")
	public String faq(Model model) throws Exception {
		
//		 서비스 -디비에 저장된 글정보 가져오기
		List<NoticeVO> boardList = nService.listAll();
		
		log.info(boardList+"");
		
//		 view 페이지로 데이터를 전달
		model.addAttribute("boardList",boardList);
//		model.addAttribute("boardList",service.listAll());
		
		return "/board/faq";
	}*/
	
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
		return "redirect:/faq_paging";
	}
	
	@GetMapping(value = "/faq_detail")
	public String noticeInfoGET(@RequestParam("notice_num") int notice_num,Model model) throws Exception{
		log.info(notice_num+"");
		
		nService.rCountUp(notice_num);
		model.addAttribute("vo",nService.getNotice(notice_num));
		
		return "/board/faq_detail";
	}
	
	@GetMapping(value = "/qni_sort")
	public String sortListGET(@RequestParam("faq_cate") String faq_cate,Criter cri, Model model) throws Exception { 
		log.info(faq_cate);
		
//		Map<String,Object> map = new HashMap<String,Object>();
		log.info(cri+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.sortCateCount(faq_cate));
		List<BoardVO> pList = service.sortCate(faq_cate, cri);
//		map.put("pList",pList);
		model.addAttribute("pList",pList);
//		map.put("pagingVO",pagingVO);
		model.addAttribute("pagingVO",pagingVO);
		
		model.addAttribute("faq_cate",faq_cate);
		
		return "/board/qni_sort";
	}
	
	@GetMapping(value="/qni_paging")
	public String pagingListGET(Criter cri,Model model) throws Exception {
	        
//	    PagingVO pagingVO = new PagingVO(); 
//	    pagingVO.setCri(cri);
	    PagingVO pagingVO = new PagingVO(cri);
	    log.info(pagingVO+"");
//	    pagingVO.setTotalCount(100);
	    pagingVO.setTotalCount(service.countBoardTotal(cri));
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
	
	@GetMapping(value="/faq_paging")
	public String pagingNoticeGET(Criter cri, Model model) throws Exception {
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(nService.noticeCnt(cri));
		List<NoticeVO> pList = nService.pagingNotices(cri);
		
		model.addAttribute("pList",pList);
		model.addAttribute("pagingVO",pagingVO);
		
		return "/board/faq_paging";
	}
	
	@GetMapping(value="/faq_update")
	public String updateNoticeGET(@RequestParam("notice_num") int notice_num, Model model) throws Exception {
		log.info("notice_num @@@@@@@@@@@@@====" + notice_num);
		NoticeVO vo = nService.getNotice(notice_num);
		
		model.addAttribute("vo",vo);
		
		return "/board/faq_update";
	}
	
	@PostMapping(value="/faq_update")
	public String updateNoticePOST(NoticeVO vo) throws Exception {
		log.info("수정할 정보 : " + vo);
		
		nService.updateNotice(vo);
		
		return "redirect:/faq_paging";
	}
	
	@GetMapping(value="/faq_delete")
	public String deleteNoticeGET(@RequestParam("notice_num") int notice_num) throws Exception {
		
		nService.deleteNotice(notice_num);
		
		return "redirect:/faq_paging";
	}
	
	@GetMapping(value="/inquiry_list")
	public String inquiryListGET(Model model) throws Exception {

		List<QnaVO> boardList = qService.qnaList();
		
		log.info(boardList+"");
		
		model.addAttribute("boardList",boardList);
//		model.addAttribute("boardList",service.listAll());
		
		return "/board/inquiry_list";
	}
	
	@GetMapping(value="/inquiry_form")
	public String inquiryWriteGET() throws Exception {
		return "/board/inquiry_form";
	}
	
	@PostMapping(value = "/inquiry_form")
	public String inquiryWritePOST(QnaVO vo,HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		log.info(vo+"@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		qService.qnaWrite(vo);
		
		return "redirect:/inquiry_list";
	}
}
