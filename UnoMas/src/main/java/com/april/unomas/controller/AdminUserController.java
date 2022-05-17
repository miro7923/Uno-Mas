package com.april.unomas.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.april.unomas.domain.CommonCriteria;
import com.april.unomas.domain.UserPageMaker;
import com.april.unomas.domain.UserVO;
import com.april.unomas.service.AdminService;


@RestController
@RequestMapping("/admin/*")
public class AdminUserController {
	
	@Inject
	private AdminService service;
	private static final Logger log = LoggerFactory.getLogger(AdminUserController.class);
	
	
	@RequestMapping(value = "/main")
	public ModelAndView adminHome(Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/adminMain");
		return mav;
	}
	
	// 전체 회원 조회
//	@RequestMapping(value = "/all_user")
//	public String selectAllUser(@RequestParam String standard, Model model) throws Exception {
//		model.addAttribute("userList", service.getAllUser());
//		
//		return "/admin/allUser";
//	}
	
//	@RequestMapping(value = "/all_user")
//	public ResponseEntity<List<UserVO>> getAllUser(@RequestParam(value="standard", required=false) String standard, Model model) throws Exception {
//		System.out.println("Rest Controller: 들어와?");
//		
//		List<UserVO> userList = service.getAllUser();
//		
//		return new ResponseEntity<List<UserVO>>(userList, HttpStatus.OK);
//	}
	
	@RequestMapping(value = "/all_user")
	public ModelAndView getAllUser(
			@RequestParam(value="standard", required=false) String standard, 
			@RequestParam(value="pagingNum", required=false, defaultValue="1") String pagingNum, 
			Model model) throws Exception {
		List<UserVO> userList;
		
		int totalUserCnt = service.allUserCount();
		
		
		CommonCriteria cri = new CommonCriteria();
		cri.setPage(Integer.parseInt(pagingNum));
		cri.setPerPageNum(2);
		
		if(standard == null) { standard = "desc"; }
		
		if(standard.equals("drop")) {
			userList = service.getDropUser(cri);
		} else {
			userList = service.getAllUser(standard, cri);
		}
		
		UserPageMaker pm = new UserPageMaker();
		pm.setTotalCount(totalUserCnt);
		pm.setCri(cri);
		pm.setTotalCount(userList.size());
		
		model.addAttribute("userList", userList);
		model.addAttribute("pagingNum", pagingNum);
		model.addAttribute("pm", pm);
		
		ModelAndView mav = new ModelAndView("admin/allUser");
		
		return mav;
	}
	
	@RequestMapping(value = "/javaTest")
	public double javaTest() throws Exception {
		System.out.println("1번" + Math.ceil(10.0));
		System.out.println("1번" + Math.ceil(10.1));
		System.out.println("2번" + Math.ceil(10/4));
		System.out.println("3번" + Math.ceil(10.0 / 4.0));
		System.out.println("4번" + Math.ceil(1/10));
		System.out.println("5번" + Math.ceil(1.0/10.0));
		
		return  Math.ceil(1/10);
	}
	
	

	
}
