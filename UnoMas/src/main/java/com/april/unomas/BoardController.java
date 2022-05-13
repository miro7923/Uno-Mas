package com.april.unomas;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
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
	
	// 업로드 폴더 경로
	@Resource(name="qnaUploadPath")
	private String uploadPath;
	
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
	
	@GetMapping(value = "/faq_insert")
	public String noticeWriteGET() throws Exception{
		
		return "/board/faq_insert";
	}
	
	/*
	 * @PostMapping(value = "/faq_insert") public String noticeWritePOST(NoticeVO
	 * vo, HttpServletRequest request,RedirectAttributes rttr) throws Exception{
	 * log.info("noticeWritePOST() 호출");
	 * 
	 * // 전달된 정보를 저장
	 * 
	 * // 서비스 - 글쓰기 동작 수행 nService.noticeWrite(vo);
	 * 
	 * // 페이지 이동(/board/list) return "redirect:/faq_paging"; }
	 */
	
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
	

	@GetMapping(value="/inquiry_form")
	public String inquiryWriteGET() throws Exception {
		return "/board/inquiry_form";
	}
	
	@PostMapping(value = "/inquiry_form")
	public String inquiryWritePOST(HttpServletRequest request,RedirectAttributes rttr, MultipartFile qna_img) throws Exception {
		QnaVO vo = new QnaVO();
		log.info(vo+"@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		vo.setUser_num(Integer.parseInt(request.getParameter("user_num")));
		vo.setQnacate_num(Integer.parseInt(request.getParameter("qnacate_num")));
		vo.setQnacate2(request.getParameter("qnacate2"));
		vo.setQna_title(request.getParameter("qna_title"));
		vo.setQna_content(request.getParameter("qna_content"));
		
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString()+"_"+qna_img.getOriginalFilename();
		log.info(fileName);
		File targetFile = new File(uploadPath,fileName);
		FileCopyUtils.copy(qna_img.getBytes(), targetFile);
		vo.setQna_img(fileName);
		
		qService.qnaWrite(vo);
		
		return "redirect:/inquiry_paging";
	}
	
	@GetMapping(value = "/inquiry_paging")
	public String inquiryPagingGET(HttpServletRequest request,Criter cri,Model model) throws Exception {
		
		
		List<QnaVO> pList = qService.pagingQnaList(1,cri);
		model.addAttribute("pList",pList);
		
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(qService.getQnaCnt(1));
		model.addAttribute("pagingVO",pagingVO);
		
		return "/board/inquiry_paging";
	}
	
	
	@PostMapping(value = "/faq_insert")
	public String noticeInsertPOST(/*NoticeVO vo,*/ HttpServletRequest request,RedirectAttributes rttr,MultipartFile notice_file,MultipartFile notice_image ) throws Exception{
		log.info("noticeWritePOST() 호출");
		
		// 전달된 정보를 저장
		NoticeVO vo = new NoticeVO();
		vo.setAdmin_num(Integer.parseInt(request.getParameter("admin_num")));
		vo.setNotice_title(request.getParameter("notice_title"));
		vo.setNotice_content(request.getParameter("notice_content"));
		
		UUID uid = UUID.randomUUID();
		
		String fileName = uid.toString()+"_"+notice_file.getOriginalFilename();
		File targetFile = new File(uploadPath,fileName);
		FileCopyUtils.copy(notice_file.getBytes(), targetFile);
		vo.setNotice_file(fileName);
		
		String imageName = uid.toString()+"_"+notice_image.getOriginalFilename();
		File targetImage = new File(uploadPath,imageName);
		FileCopyUtils.copy(notice_image.getBytes(), targetImage);
		vo.setNotice_image(imageName);
		
		// 서비스 - 글쓰기 동작 수행
		nService.noticeWrite(vo);
		
		// 페이지 이동(/board/list)
		return "redirect:/faq_paging";
	}
	
}
