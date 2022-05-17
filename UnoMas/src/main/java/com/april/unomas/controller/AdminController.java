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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.PagingVO;
import com.april.unomas.domain.UserVO;
import com.april.unomas.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger log 
	= LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	@Resource(name="noticeFileUploadPath")
	private String noticeFileUploadPath;
	
	@Resource(name="noticeImageUploadPath")
	private String noticeImageUploadPath;
	
	
	@GetMapping(value = "/main")
	public String adminMainGET(Criter cri,Model model) {
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.userCount());
		List<UserVO> userList = service.userView(cri);
		
		model.addAttribute("userList", userList);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/admin/main";
	}
	
	@GetMapping(value = "/faq_board")
	public String faqBoardGET(Criter cri,Model model) {
		
		PagingVO pagingVO = new PagingVO(cri);
		pagingVO.setTotalCount(service.noticeCount());
		List<NoticeVO> noticeList = service.noticeView(cri);
		log.info(noticeList+"$$*****************************************");
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pagingVO",pagingVO);
		
		return "/admin/faq_board";
	}
	
	@GetMapping(value = "/faq_write")
	public String faqWriteGET(Model model,HttpSession session) throws Exception{
		AdminVO vo = (AdminVO) session.getAttribute("saveID");
		model.addAttribute("vo",vo);
		
		return "/admin/faq_write";
	}
	
	@PostMapping(value = "/faq_write")
	public String faqWritePOST(HttpServletRequest request,RedirectAttributes rttr,MultipartFile notice_file,MultipartFile notice_img) throws Exception{
		
		// 전달된 정보를 저장
		NoticeVO vo = new NoticeVO();
		vo.setAdmin_num(Integer.parseInt(request.getParameter("admin_num")));
		vo.setNotice_title(request.getParameter("notice_title"));
		vo.setNotice_content(request.getParameter("notice_content"));
		vo.setNotice_ip(request.getRemoteAddr());
				
		UUID uid = UUID.randomUUID();
				
		String fileName = uid.toString()+"_"+notice_file.getOriginalFilename();
		File targetFile = new File(noticeFileUploadPath,fileName);
		FileCopyUtils.copy(notice_file.getBytes(), targetFile);
		vo.setNotice_file(fileName);
				
		String imageName = uid.toString()+"_"+notice_img.getOriginalFilename();
		File targetImage = new File(noticeImageUploadPath,imageName);
		FileCopyUtils.copy(notice_img.getBytes(), targetImage);
		vo.setNotice_img(imageName);
				
		// 서비스 - 글쓰기 동작 수행
		service.noticeWrite(vo);
		
		return "redirect:/admin/faq_board";
	}
	
	@GetMapping(value = "/admin_login")
	public String adminLoginGET() {
		
		return "/admin/admin_login";
	}
	
	@PostMapping(value = "/admin_login")
	public String adminLoginPOST(AdminVO vo,HttpSession session) {
		
		AdminVO adminVO = service.adminLogin(vo);
		
		// 로그인 실패
		if(adminVO == null || adminVO.getAdmin_permit() != 1) {
			return "redirect:/user/login";
		}
		log.info("로그인 실패");
				
		log.info(adminVO+"");
		
		// 로그인 성공 및 정보 저장
		session.setAttribute("saveID", adminVO);
		log.info("로그인 성공!");
		
		return "redirect:/admin/faq_board";
	}
}
