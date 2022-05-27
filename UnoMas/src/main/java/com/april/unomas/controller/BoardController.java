package com.april.unomas.controller;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import com.april.unomas.domain.UserVO;
import com.april.unomas.service.BoardService;
import com.april.unomas.service.NoticeService;
import com.april.unomas.service.QnaService;

@Controller
@RequestMapping("/board/*")
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
	private String qnaUploadPath;
	
	@Resource(name="noticeFileUploadPath")
	private String noticeFileUploadPath;
	
	@Resource(name="noticeImageUploadPath")
	private String noticeImageUploadPath;
	
	@RequestMapping(value = "/qni_write",method = RequestMethod.GET)
	public String boardWriteGET() throws Exception{
		log.info("registGET() 호출 -> /board/qni_write.jsp 이동");
		
		return "/board/qni_write";
	}
	
	// 글쓰기  /board/regist  (post)
	@RequestMapping(value = "/qni_write",method = RequestMethod.POST)
	public String boardWritePOST(BoardVO vo, HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		log.info("boardWritePOST() 호출");
		
		// 전달된 정보를 저장
		
		// 서비스 - 글쓰기 동작 수행
		service.boardWrite(vo);
		
		// 페이지 이동(/board/list)
		return "redirect:/board/qni_paging";
	}
	
	@RequestMapping(value = "/faq_insert",method = RequestMethod.GET)
	public String noticeWriteGET() throws Exception{
		
		return "/board/faq_insert";
	}
	
	@RequestMapping(value = "/faq_detail",method = RequestMethod.GET)
	public String noticeInfoGET(@RequestParam("notice_num") int notice_num,Model model) throws Exception{
		log.info(notice_num+"");
		
		nService.rCountUp(notice_num);
		model.addAttribute("vo",nService.getNotice(notice_num));
		
		return "/board/faq_detail";
	}
	
	@RequestMapping(value = "/qni_sort",method = RequestMethod.GET)
	public String sortListGET(@RequestParam("qnacate_num") Integer qnacate_num,Criter cri, Model model) throws Exception { 
		
//		Map<String,Object> map = new HashMap<String,Object>();
		log.info(cri+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		log.info(qnacate_num+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.sortCateCount(qnacate_num));
		List<BoardVO> pList = service.sortCate(qnacate_num, cri);
		log.info(pList+"!@#$%!@#$%!@#$%!@#$%!@#$%!@#$%!@#$%");
//		map.put("pList",pList);
		model.addAttribute("pList",pList);
//		map.put("pagingVO",pagingVO);
		model.addAttribute("pagingVO",pagingVO);
		
		model.addAttribute("qnacate_num",qnacate_num);
		
		return "/board/qni_sort";
	}
	
	@RequestMapping(value="/qni_paging",method = RequestMethod.GET)
	public String pagingListGET(Criter cri,Model model) throws Exception {
//	    PagingVO pagingVO = new PagingVO(); 
//	    pagingVO.setCri(cri);
	    PagingVO pagingVO = new PagingVO(cri);
	    log.info(pagingVO+"");
//	    pagingVO.setTotalCount(100);
	    pagingVO.setTotalCount(service.countBoardTotal());
	    List<BoardVO> pList = service.selectBoardList(cri);
	    log.info(pList+"!@#$!@#$!@#$!@#$!@#$!@#$!@#$!@#$");
	    model.addAttribute("pList", pList);
	    model.addAttribute("pagingVO", pagingVO);
	        
	    return "/board/qni_paging";
	        
	}
	
	@RequestMapping(value="/qni_update",method = RequestMethod.GET)
	public String updateBoardGET(@RequestParam("faq_num") int faq_num, Model model) throws Exception {
		
		BoardVO vo = service.getBoard(faq_num);
		
		model.addAttribute("vo",vo);
		
		return "/board/qni_update";
	}
	
	@RequestMapping(value="/qni_update",method = RequestMethod.POST)
	public String updateBoardPOST(BoardVO vo) throws Exception {
		log.info("수정할 정보 : " + vo);
		service.updateBoard(vo);
		
		
		
		return "redirect:/board/qni_paging";
	}
	
	@RequestMapping(value="/qni_delete",method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("faq_num") int faq_num) throws Exception {
		
		service.deleteBoard(faq_num);
		
		return "redirect:/board/qni_paging";
	}
	
	@RequestMapping(value="/faq_paging",method = RequestMethod.GET)
	public String pagingNoticeGET(Criter cri, Model model) throws Exception {
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(nService.noticeCnt(cri));
		List<NoticeVO> pList = nService.pagingNotices(cri);
		log.info(pList+"$$*****************************************");
		
		model.addAttribute("pList",pList);
		model.addAttribute("pagingVO",pagingVO);
		
		return "/board/faq_paging";
	}
	
	@RequestMapping(value="/faq_update",method = RequestMethod.GET)
	public String updateNoticeGET(@RequestParam("notice_num") int notice_num, Model model) throws Exception {
		log.info("notice_num @@@@@@@@@@@@@====" + notice_num);
		NoticeVO vo = nService.getNotice(notice_num);
		
		model.addAttribute("vo",vo);
		
		return "/board/faq_update";
	}
	
	@RequestMapping(value="/faq_update",method = RequestMethod.POST)
	public String updateNoticePOST(NoticeVO vo) throws Exception {
		log.info("수정할 정보 : " + vo);
		
		nService.updateNotice(vo);
		
		return "redirect:/board/faq_paging";
	}
	
	@RequestMapping(value="/faq_delete",method = RequestMethod.GET)
	public String deleteNoticeGET(@RequestParam("notice_num") int notice_num) throws Exception {
		
		nService.deleteNotice(notice_num);
		
		return "redirect:/board/faq_paging";
	}
	

	@RequestMapping(value="/inquiry_form",method = RequestMethod.GET)
	public String inquiryWriteGET() throws Exception {
		return "/board/inquiry_form";
	}
	
	@RequestMapping(value = "/inquiry_form",method = RequestMethod.POST)
	public String inquiryWritePOST(HttpServletRequest request,RedirectAttributes rttr, MultipartFile qna_image1,MultipartFile qna_image2,HttpSession session) throws Exception {
		QnaVO vo = new QnaVO();
		String saveID = (String) session.getAttribute("saveID");
		log.info(vo+"@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		vo.setQnacate_num(Integer.parseInt(request.getParameter("qnacate_num")));
		vo.setQnacate2(request.getParameter("qnacate2"));
		vo.setQna_title(request.getParameter("qna_title"));
		vo.setQna_content(request.getParameter("qna_content"));
		
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString()+"_"+qna_image1.getOriginalFilename();
		log.info(fileName);
		File targetFile = new File(qnaUploadPath,fileName);
		FileCopyUtils.copy(qna_image1.getBytes(), targetFile);
		vo.setQna_image1(fileName);
		
		UUID uid2 = UUID.randomUUID();
		String fileName2 = uid2.toString()+"_"+qna_image2.getOriginalFilename();
		File targetFile2 = new File(qnaUploadPath,fileName2);
		FileCopyUtils.copy(qna_image2.getBytes(), targetFile2);
		vo.setQna_image2(fileName2);
		log.info(vo+"###########################");
		qService.qnaWrite(saveID,vo);
		
		return "redirect:/board/inquiry_paging";
	}
	
	@RequestMapping(value = "/inquiry_paging",method = RequestMethod.GET)
	public String inquiryPagingGET(HttpServletResponse response, HttpServletRequest request,Criter cri,Model model,HttpSession session) throws Exception {
		log.info("session"+session.getAttribute("saveID")+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$");
		if(session.getAttribute("saveID") == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>if(confirm('로그인 하시겠습니까?')){ location.href='/user/login';} else { history.back();}</script>");
			out.flush();
		}
		String saveID = (String) session.getAttribute("saveID");
		List<QnaVO> pList = qService.pagingQnaList(saveID,cri);
		model.addAttribute("pList",pList);
		
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(qService.getQnaCnt(saveID));
		model.addAttribute("pagingVO",pagingVO);
		return "/board/inquiry_paging";
	}
	
	
	@RequestMapping(value = "/faq_insert",method = RequestMethod.POST)
	public String noticeInsertPOST(/*NoticeVO vo,*/ HttpServletRequest request,RedirectAttributes rttr,MultipartFile notice_file,MultipartFile notice_img ) throws Exception{
		log.info("noticeWritePOST() 호출");
		
		// 전달된 정보를 저장
		NoticeVO vo = new NoticeVO();
		vo.setAdmin_num(Integer.parseInt(request.getParameter("admin_num")));
		vo.setNotice_title(request.getParameter("notice_title"));
		vo.setNotice_content(request.getParameter("notice_content"));
		vo.setNotice_ip(request.getRemoteAddr());
		UUID uid = UUID.randomUUID();
		
		if(notice_file.getOriginalFilename() == null) {
		String fileName = uid.toString()+"_"+notice_file.getOriginalFilename();
		File targetFile = new File(noticeFileUploadPath,fileName);
		FileCopyUtils.copy(notice_file.getBytes(), targetFile);
		vo.setNotice_file(fileName);
		} 
		
		if(notice_img.getOriginalFilename() != null) {
		String imageName = uid.toString()+"_"+notice_img.getOriginalFilename();
		File targetImage = new File(noticeImageUploadPath,imageName);
		FileCopyUtils.copy(notice_img.getBytes(), targetImage);
		vo.setNotice_img(imageName);
		} 
		// 서비스 - 글쓰기 동작 수행
		nService.noticeInsert(vo);
		
		// 페이지 이동(/board/list)
		return "redirect:/board/faq_paging";
	}
	
	@RequestMapping(value = "/nFileDown",method = RequestMethod.GET)
	public void noticeFileDownload(HttpServletResponse response,@RequestParam("notice_file") String notice_file) throws Exception{
		byte[] fileByte = FileUtils.readFileToByteArray(new File(noticeFileUploadPath+"\\"+notice_file));
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(notice_file,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	@RequestMapping(value = "/image1Down",method = RequestMethod.GET)
	public void inquiryImage1Download(HttpServletResponse response,@RequestParam("qna_image1") String qna_image1) throws Exception {
		byte[] fileByte = FileUtils.readFileToByteArray(new File(qnaUploadPath+"\\"+qna_image1));
		
		response.setContentType("application/cotet-stream");
		response.setHeader("content-Disposition", "attachment; filename=\""+URLEncoder.encode(qna_image1,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@RequestMapping(value = "/image2Down",method = RequestMethod.GET)
	public void inquiryImage2Download(HttpServletResponse response,@RequestParam("qna_image2") String qna_image2) throws Exception {
		byte[] fileByte = FileUtils.readFileToByteArray(new File(qnaUploadPath+"\\"+qna_image2));
		
		response.setContentType("application/cotet-stream");
		response.setHeader("content-Disposition", "attachment; filename=\""+URLEncoder.encode(qna_image2,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	
	@RequestMapping(value = "/inquiry_delete",method = RequestMethod.GET)
	public String inquiryDelete(@RequestParam("qna_num") Integer qna_num, 
			@RequestParam(value="pageInfo", required = false, defaultValue="") String pageInfo) throws Exception {
		qService.deleteInquiry(qna_num);
		
		if(pageInfo.equals("my")) {
			return "redirect:/user/my_question";
		} else {
			return "redirect:/board/inquiry_paging";
		}
		
	}
	
	@RequestMapping(value = "/inquiry_comment",method = RequestMethod.GET)
	public String inquiryCommentGET(@RequestParam("qna_num") Integer qna_num, Model model) throws Exception {
		model.addAttribute("commentList",qService.getComment(qna_num));
		
		return "/board/inquiry_comment";
	}
	
}
