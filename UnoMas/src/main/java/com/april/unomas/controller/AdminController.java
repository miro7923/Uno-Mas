package com.april.unomas.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.PagingVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;
import com.april.unomas.domain.UserVO;
import com.april.unomas.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger log 
	= LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	// 업로드 폴더 경로
	@Resource(name="qnaUploadPath")
	private String qnaUploadPath;
	
	@Resource(name="noticeFileUploadPath")
	private String noticeFileUploadPath;
	
	@Resource(name="noticeImageUploadPath")
	private String noticeImageUploadPath;
	
	@RequestMapping(value = "/main",method = RequestMethod.GET)
	public String adminMainGET(Criter cri,Model model) throws Exception{
		return "/admin/main";
	}

	@RequestMapping(value = "/admin_logout",method = RequestMethod.GET)
	public String adminLogoutGET(AdminVO vo,HttpSession session) throws Exception {
		session.invalidate();
		
		return "/index";
	}
	
	@RequestMapping(value = "/notice_board",method = RequestMethod.GET)
	public String noticeBoardGET(Criter cri,Model model) throws Exception{
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.noticeCount());
		List<NoticeVO> noticeList = service.noticeView(cri);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pagingVO",pagingVO);
		return "/admin/notice_board";
	}
	
	@RequestMapping(value = "/notice_search",method = RequestMethod.GET)
	public String searchNoticeGET(Criter cri,Model model) throws Exception{
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.searchNoticeCount(cri));
		List<NoticeVO> noticeList = service.noticeView(cri);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pagingVO",pagingVO);
		return "/admin/notice_search";
	}
	
	@RequestMapping(value = "/notice_write",method = RequestMethod.GET)
	public String noticeWriteGET(Model model,HttpSession session) throws Exception{
		AdminVO vo = (AdminVO) session.getAttribute("saveID");
		model.addAttribute("vo",vo);
		return "/admin/notice_write";
	}
	
	@RequestMapping(value = "/notice_write",method = RequestMethod.POST)
	public String noticeWritePOST(HttpServletRequest request,RedirectAttributes rttr,MultipartFile notice_file,MultipartFile notice_img) throws Exception{
		NoticeVO vo = new NoticeVO();
		vo.setAdmin_num(Integer.parseInt(request.getParameter("admin_num")));
		vo.setNotice_title(request.getParameter("notice_title"));
		vo.setNotice_content(request.getParameter("notice_content"));
		vo.setNotice_ip(request.getRemoteAddr());
		
		if(!notice_file.isEmpty()) {
//		UUID uid = UUID.randomUUID();	
//		String fileName = uid.toString()+"_"+notice_file.getOriginalFilename();
		String fileName = notice_file.getOriginalFilename();
		
		File targetFile = new File(noticeFileUploadPath,fileName);
		FileCopyUtils.copy(notice_file.getBytes(), targetFile);
		vo.setNotice_file(fileName);
		}
		if(!notice_img.isEmpty()) {
//		UUID uid = UUID.randomUUID();
//		String imageName = uid.toString()+"_"+notice_img.getOriginalFilename();
		String imageName = notice_img.getOriginalFilename();
		
		File targetImage = new File(noticeImageUploadPath,imageName);
		FileCopyUtils.copy(notice_img.getBytes(), targetImage);
		vo.setNotice_img(imageName);
		}		
		service.noticeWrite(vo);
		return "redirect:/admin/notice_board";
	}
	
	@RequestMapping(value = "/notice_read",method = RequestMethod.GET)
	public String noticeInfoGET(@RequestParam("notice_num") int notice_num,Model model) throws Exception{
		service.rCountUp(notice_num);
		model.addAttribute("vo",service.getNotice(notice_num));
		return "/admin/notice_read";
	}
	
	@RequestMapping(value="/notice_update",method = RequestMethod.GET)
	public String noticeUpdateGET(@RequestParam("notice_num") int notice_num, Model model) throws Exception {
		NoticeVO vo = service.getNotice(notice_num);
		model.addAttribute("vo",vo);
		return "/admin/notice_update";
	}
	
	@RequestMapping(value="/notice_update",method = RequestMethod.POST)
	public String noticeUpdatePOST(@RequestParam("notice_num") int notice_num,HttpServletRequest request) throws Exception {
		NoticeVO vo = new NoticeVO();
		vo.setNotice_num(notice_num);
		vo.setNotice_title(request.getParameter("notice_title"));
		vo.setNotice_content(request.getParameter("notice_content"));
		service.noticeUpdate(vo);
		return "redirect:/admin/notice_board";
	}
	
	@RequestMapping(value="/notice_delete",method = RequestMethod.GET)
	public String noticeDeleteGET(@RequestParam("notice_num") int notice_num) throws Exception {
		service.noticeDelete(notice_num);
		return "redirect:/admin/notice_board";
	}
	
	@RequestMapping(value = "/faq_write",method = RequestMethod.GET)
	public String boardWriteGET() throws Exception{
		return "/admin/faq_write";
	}
	
	// 글쓰기  /board/regist  (post)
	@RequestMapping(value = "/faq_write",method = RequestMethod.POST)
	public String boardWritePOST(BoardVO vo, HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		service.faqWrite(vo);
		return "redirect:/admin/faq_board";
	}
	
	@RequestMapping(value = "/faq_sort",method = RequestMethod.GET)
	public String sortListGET(@RequestParam("qnacate_num") Integer qnacate_num,Criter cri, Model model) throws Exception { 
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.faqSortCount(qnacate_num));
		List<BoardVO> pList = service.faqSortView(qnacate_num, cri);
		model.addAttribute("pList",pList);
		model.addAttribute("pagingVO",pagingVO);
		model.addAttribute("qnacate_num",qnacate_num);
		return "/admin/faq_sort";
	}
	
	@RequestMapping(value="/faq_board",method = RequestMethod.GET)
	public String pagingListGET(Criter cri,Model model) throws Exception {
	    PagingVO pagingVO = new PagingVO(cri);
	    pagingVO.setTotalCount(service.searchFaqCount(cri));
	    List<BoardVO> pList = service.faqView(cri);
	    model.addAttribute("pList", pList);
	    model.addAttribute("pagingVO", pagingVO);
	    return "/admin/faq_board";
	}
	
	@RequestMapping(value="/faq_search",method = RequestMethod.GET)
	public String searchFaqGET(Criter cri,Model model) throws Exception {
	    PagingVO pagingVO = new PagingVO(cri);
	    pagingVO.setTotalCount(service.searchFaqCount(cri));
	    List<BoardVO> pList = service.faqView(cri);
	    model.addAttribute("pList", pList);
	    model.addAttribute("pagingVO", pagingVO);
	    return "/admin/faq_search";
	}
	
	@RequestMapping(value="/faq_update",method = RequestMethod.GET)
	public String updateBoardGET(@RequestParam("faq_num") int faq_num, Model model) throws Exception {
		BoardVO vo = service.getFaq(faq_num);
		model.addAttribute("vo",vo);
		return "/admin/faq_update";
	}
	
	@RequestMapping(value="/faq_update",method = RequestMethod.POST)
	public String updateBoardPOST(BoardVO vo) throws Exception {
		service.faqUpdate(vo);
		return "redirect:/admin/faq_board";
	}
	
	@RequestMapping(value="/faq_delete",method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("faq_num") int faq_num) throws Exception {
		service.faqDelete(faq_num);
		return "redirect:/admin/faq_board";
	}
	
	@RequestMapping(value = "/qna_board",method = RequestMethod.GET)
	public String inquiryPagingGET(HttpServletRequest request,Criter cri,Model model,HttpSession session) throws Exception {
		String adminVO = (String) session.getAttribute("saveAID");
		if(adminVO == null) {
			return "redirect:/user/user_login";
		}
		List<QnaVO> pList = service.qnaView(cri);
		model.addAttribute("pList",pList);
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.qnaCount());
		model.addAttribute("pagingVO",pagingVO);
		return "/admin/qna_board";
	}
	
	@RequestMapping(value = "/qna_comment",method = RequestMethod.GET)
	public String qnaCommentWriteGET(@RequestParam("qna_num") Integer qna_num, Model model,HttpSession session) throws Exception {
		String adminVO = (String) session.getAttribute("saveAID");

		model.addAttribute("admin_id",adminVO);

		model.addAttribute("qnaVO",service.getQna(qna_num));
		model.addAttribute("qna_num",qna_num);
		return "/admin/qna_comment";
	}
	
	@RequestMapping(value = "/qna_comment",method = RequestMethod.POST)
	public String qnaCommentWritePOST(Qna_ComVO qna_comVO,HttpServletRequest request) throws Exception {
		service.qnaCommentWrite(qna_comVO);
		service.qnaProcessUp(Integer.parseInt(request.getParameter("qna_num")));
		return "redirect:/admin/qna_board";
	}
	
	@RequestMapping(value = "/qna_commentView",method = RequestMethod.GET)
	public String qnaCommentViewGET(@RequestParam("qna_num") Integer qna_num,Model model) throws Exception {
		model.addAttribute("vo",service.qnaCommentView(qna_num));
		return "/admin/qna_commentView";
	}
	
	@RequestMapping(value = "/image1Down",method = RequestMethod.GET)
	public void qnaImage1Download(HttpServletResponse response,@RequestParam("qna_image1") String qna_image1) throws Exception {
		byte[] fileByte = FileUtils.readFileToByteArray(new File(qnaUploadPath+File.separator+qna_image1));
		response.setContentType("application/cotet-stream");
		response.setHeader("content-Disposition", "attachment; filename=\""+URLEncoder.encode(qna_image1,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@RequestMapping(value = "/image2Down",method = RequestMethod.GET)
	public void inquiryImage2Download(HttpServletResponse response,@RequestParam("qna_image2") String qna_image2) throws Exception {
		byte[] fileByte = FileUtils.readFileToByteArray(new File(qnaUploadPath+File.separator+qna_image2));
		response.setContentType("application/cotet-stream");
		response.setHeader("content-Disposition", "attachment; filename=\""+URLEncoder.encode(qna_image2,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}


	@RequestMapping(value = "/qna_delete",method = RequestMethod.GET)
	public String qnaDeleteGET(@RequestParam("qna_num") Integer qna_num) throws Exception {
		service.deleteQna(qna_num);
		
		return "redirect:/admin/qna_board";

	}
	
}
