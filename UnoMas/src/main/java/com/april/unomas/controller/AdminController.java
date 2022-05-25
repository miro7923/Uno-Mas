package com.april.unomas.controller;

import java.io.File;
import java.util.List;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService service;

	// 업로드 폴더 경로
	@Resource(name = "qnaUploadPath")
	private String qnaUploadPath;

	@Resource(name = "noticeFileUploadPath")
	private String noticeFileUploadPath;

	@Resource(name = "noticeImageUploadPath")
	private String noticeImageUploadPath;

	@RequestMapping(value = "/main",method = RequestMethod.GET)
	public String adminMainGET(Criter cri,Model model) throws Exception{
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.userCount());
		List<UserVO> userList = service.userView(cri);

		model.addAttribute("userList", userList);
		model.addAttribute("pagingVO", pagingVO);

		return "/admin/main";
	}

	@RequestMapping(value = "/admin_login",method = RequestMethod.GET)
	public String adminLoginGET() {
		return "/admin/admin_login";
	}

	@RequestMapping(value = "/admin_login",method = RequestMethod.POST)
	public String adminLoginPOST(AdminVO vo,HttpSession session) throws Exception{

		Integer result = service.adminLogin(vo);

		if (result == 1) {
			session.setAttribute("saveAdmin", vo);
		}

		return Integer.toString(result);
	}
	
	@RequestMapping(value = "/admin_logout", method = RequestMethod.GET)
	public String adminLogoutGET(HttpSession session) {
		session.invalidate();

		return "redirect:/index";
	}

	@RequestMapping(value = "/notice_board",method = RequestMethod.GET)
	public String noticeBoardGET(Criter cri,Model model) throws Exception{

		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.noticeCount());
		List<NoticeVO> noticeList = service.noticeView(cri);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingVO", pagingVO);

		return "/admin/notice_board";
	}

	@RequestMapping(value = "/notice_write",method = RequestMethod.GET)
	public String noticeWriteGET(Model model,HttpSession session) throws Exception{
		AdminVO vo = (AdminVO) session.getAttribute("saveID");
		model.addAttribute("vo", vo);

		return "/admin/notice_write";
	}

	@RequestMapping(value = "/notice_write",method = RequestMethod.POST)
	public String noticeWritePOST(HttpServletRequest request, RedirectAttributes rttr, MultipartFile notice_file,
			MultipartFile notice_img) throws Exception {

		// 전달된 정보를 저장
		NoticeVO vo = new NoticeVO();
		vo.setAdmin_num(Integer.parseInt(request.getParameter("admin_num")));
		vo.setNotice_title(request.getParameter("notice_title"));
		vo.setNotice_content(request.getParameter("notice_content"));
		vo.setNotice_ip(request.getRemoteAddr());

		UUID uid = UUID.randomUUID();

		String fileName = uid.toString() + "_" + notice_file.getOriginalFilename();
		File targetFile = new File(noticeFileUploadPath, fileName);
		FileCopyUtils.copy(notice_file.getBytes(), targetFile);
		vo.setNotice_file(fileName);

		String imageName = uid.toString() + "_" + notice_img.getOriginalFilename();
		File targetImage = new File(noticeImageUploadPath, imageName);
		FileCopyUtils.copy(notice_img.getBytes(), targetImage);
		vo.setNotice_img(imageName);

		// 서비스 - 글쓰기 동작 수행
		service.noticeWrite(vo);

		return "redirect:/admin/notice_board";
	}

	@RequestMapping(value = "/notice_read",method = RequestMethod.GET)
	public String noticeInfoGET(@RequestParam("notice_num") int notice_num, Model model) throws Exception {
		log.info(notice_num + "");

		service.rCountUp(notice_num);
		model.addAttribute("vo", service.getNotice(notice_num));

		return "/admin/notice_read";
	}

	@RequestMapping(value="/notice_update",method = RequestMethod.GET)
	public String noticeUpdateGET(@RequestParam("notice_num") int notice_num, Model model) throws Exception {
		log.info("notice_num @@@@@@@@@@@@@====" + notice_num);
		NoticeVO vo = service.getNotice(notice_num);

		model.addAttribute("vo", vo);

		return "/admin/notice_update";
	}

	@RequestMapping(value="/notice_update",method = RequestMethod.POST)
	public String noticeUpdatePOST(NoticeVO vo) throws Exception {
		log.info("수정할 정보 : " + vo);

		service.noticeUpdate(vo);

		return "redirect:/admin/notice_board";
	}

	@RequestMapping(value="/notice_delete",method = RequestMethod.GET)
	public String noticeDeleteGET(@RequestParam("notice_num") int notice_num) throws Exception {

		service.noticeDelete(notice_num);

		return "redirect:/admin/notice_board";
	}

	@RequestMapping(value = "/faq_write",method = RequestMethod.GET)
	public String boardWriteGET() throws Exception {
		log.info("registGET() 호출 -> /board/qni_write.jsp 이동");

		return "/admin/faq_write";
	}

	// 글쓰기 /board/regist (post)
	@RequestMapping(value = "/faq_write",method = RequestMethod.POST)
	public String boardWritePOST(BoardVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		log.info("boardWritePOST() 호출");

		// 전달된 정보를 저장

		// 서비스 - 글쓰기 동작 수행
		service.faqWrite(vo);

		// 페이지 이동(/board/list)
		return "redirect:/admin/faq_board";
	}

	@RequestMapping(value = "/faq_sort",method = RequestMethod.GET)
	public String sortListGET(@RequestParam("qnacate_num") Integer qnacate_num, Criter cri, Model model)
			throws Exception {

//		Map<String,Object> map = new HashMap<String,Object>();
		log.info(cri + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		log.info(qnacate_num + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.faqSortCount(qnacate_num));
		List<BoardVO> pList = service.faqSortView(qnacate_num, cri);
		log.info(pList + "!@#$%!@#$%!@#$%!@#$%!@#$%!@#$%!@#$%");
//		map.put("pList",pList);
		model.addAttribute("pList", pList);
//		map.put("pagingVO",pagingVO);
		model.addAttribute("pagingVO", pagingVO);

		model.addAttribute("qnacate_num", qnacate_num);

		return "/admin/faq_sort";
	}

	@RequestMapping(value="/faq_board",method = RequestMethod.GET)
	public String pagingListGET(Criter cri, Model model) throws Exception {
//	    PagingVO pagingVO = new PagingVO(); 
//	    pagingVO.setCri(cri);
		PagingVO pagingVO = new PagingVO(cri);
//	    pagingVO.setTotalCount(100);
		pagingVO.setTotalCount(service.faqCount());
		List<BoardVO> pList = service.faqView(cri);
		model.addAttribute("pList", pList);
		model.addAttribute("pagingVO", pagingVO);

		return "/admin/faq_board";

	}

	@RequestMapping(value="/faq_update",method = RequestMethod.GET)
	public String updateBoardGET(@RequestParam("faq_num") int faq_num, Model model) throws Exception {

		BoardVO vo = service.getFaq(faq_num);

		model.addAttribute("vo", vo);

		return "/admin/faq_update";
	}

	@RequestMapping(value="/faq_update",method = RequestMethod.POST)
	public String updateBoardPOST(BoardVO vo) throws Exception {
		log.info("수정할 정보 : " + vo);
		service.faqUpdate(vo);

		return "redirect:/admin/faq_board";
	}

	@RequestMapping(value="/faq_delete",method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("faq_num") int faq_num) throws Exception {

		service.faqDelete(faq_num);

		return "redirect:/admin/faq_board";
	}

	@RequestMapping(value = "/qna_board",method = RequestMethod.GET)
	public String inquiryPagingGET(HttpServletRequest request, Criter cri, Model model, HttpSession session)
			throws Exception {

		AdminVO adminVO = (AdminVO) session.getAttribute("saveID");
		if (adminVO == null) {
			return "redirect:/admin/admin_login";
		}
		List<QnaVO> pList = service.qnaView(cri);
		log.info(pList + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		model.addAttribute("pList", pList);

		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.qnaCount());
		model.addAttribute("pagingVO", pagingVO);
		log.info(pList + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return "/admin/qna_board";
	}

	@RequestMapping(value = "/qna_comment",method = RequestMethod.GET)
	public String qnaCommentWriteGET(@RequestParam("qna_num") Integer qna_num, Model model, HttpSession session)
			throws Exception {
		AdminVO adminVO = (AdminVO) session.getAttribute("saveID");
		model.addAttribute("admin_id", adminVO.getAdmin_id());
		model.addAttribute("qnaVO", service.getQna(qna_num));
		model.addAttribute("qna_num", qna_num);

		return "/admin/qna_comment";
	}

	@RequestMapping(value = "/qna_comment",method = RequestMethod.POST)
	public String qnaCommentWritePOST(Qna_ComVO qna_comVO, HttpServletRequest request) throws Exception {
		service.qnaCommentWrite(qna_comVO);
		service.qnaProcessUp(Integer.parseInt(request.getParameter("qna_num")));
		return "redirect:/admin/qna_board";
	}

	@GetMapping(value = "/qna_commentView")
	public String qnaCommentViewGET(@RequestParam("qna_num") Integer qna_num, Model model) throws Exception {

		model.addAttribute("vo", service.qnaCommentView(qna_num));
		return "/admin/qna_commentView";
	}

}
