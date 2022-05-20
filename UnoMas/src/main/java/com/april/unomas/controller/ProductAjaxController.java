package com.april.unomas.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.Commons;
import com.april.unomas.domain.ImgType;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.service.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductAjaxController {

	@Inject
	private ProductService service;
	
	private static final Logger log = LoggerFactory.getLogger(ProductAjaxController.class);

	@Resource(name = "reviewImgUploadPath")
	private String reviewImgUploatPath;
	
	@Resource(name = "prodDimgUploadPath")
	private String prodDimgUploadPath;
	
	@Resource(name = "prodThumbUploadPath")
	private String prodThumbUploadPath;
	
	@Resource(name = "prodTopImgUploadPath")
	private String prodTopImgUploadPath;
	
	@Resource(name = "prodSoldoutImgUploadPath")
	private String prodSoldoutImgUploadPath;
	
	// ajax로 장바구니에 물건 담기
	@RequestMapping(value = "/insert_cart", method = RequestMethod.GET)
	public void insertCartPOST(@RequestParam("user_num") int user_num, 
			@RequestParam("prod_num") int prod_num, @RequestParam("prod_amount") int prod_amount) throws Exception {
		log.info("insertCartPOST() 호출");

		if (service.getProdInCart(user_num, prod_num) == null) {
			// 없는 상품이면 필드 새로 생성
			service.insertCart(user_num, prod_num, prod_amount);
		}
		else {
			// 장바구니에 있는 상품이면 수량 증가
			service.modifyCartAmount(user_num, prod_num, prod_amount);
		}
	}
	
	@RequestMapping(value = "/update_readcnt", method = RequestMethod.GET)
	public int updateReviewReadcntGET(@RequestParam int review_num) throws Exception {
		service.updateReviewReadcnt(review_num);
		
		return service.getReview(review_num).getReview_readcnt();
	}
	
	@RequestMapping(value = "/add_wishlist", method = RequestMethod.GET)
	public void addWishlistGET(@RequestParam int user_num, @RequestParam int prod_num, Model model) throws Exception {
		// 위시리스트 비동기로 추가 메서드
		service.addWishlist(user_num, prod_num);
		model.addAttribute("isInWishlist", true);
	}
	
	@RequestMapping(value = "/delete_wishlist", method = RequestMethod.GET)
	public void deleteWishlistGET(@RequestParam int user_num, @RequestParam int prod_num, Model model) throws Exception {
		service.removeWishlist(user_num, prod_num);
		model.addAttribute("isInWishlist", false);
	}
	
	@RequestMapping(value = "/upload_topImg", method = RequestMethod.POST)
	public String uploadTopImgPOST(@RequestParam("uploadImg1") MultipartFile file) throws Exception {
		log.info("@@@@@@@@@@@@@@@@@@@ 상세이미지 등록 컨트롤러 이동");
		String fileName = null;
		if (!file.isEmpty()) {
			fileName = Commons.convertImgName(file.getOriginalFilename(), service.getLastProdNum() + 1, ImgType.TOP);
			File targetFile = new File(prodTopImgUploadPath, fileName);
			FileCopyUtils.copy(file.getBytes(), targetFile);
		}
		
		return fileName;
	}

	@RequestMapping(value = "/upload_deImg", method = RequestMethod.POST)
	public String uploadDeImgPOST(@RequestParam("uploadImg2") MultipartFile file) throws Exception {
		String fileName = null;
		if (!file.isEmpty()) {
			fileName = Commons.convertImgName(file.getOriginalFilename(), service.getLastProdNum() + 1, ImgType.DETAIL);
			File targetFile = new File(prodDimgUploadPath, fileName);
			FileCopyUtils.copy(file.getBytes(), targetFile);
		}
		
		return fileName;
	}

	@RequestMapping(value = "/upload_thumb", method = RequestMethod.POST)
	public String uploadThumbPOST(@RequestParam("uploadImg3") MultipartFile file) throws Exception {
		String fileName = null;
		if (!file.isEmpty()) {
			fileName = Commons.convertImgName(file.getOriginalFilename(), service.getLastProdNum() + 1, ImgType.THUMBNAIL);
			Commons.resizeImg(file, prodThumbUploadPath, fileName);
		}
		
		return fileName;
	}
	
	@RequestMapping(value = "/upload_soldoutImg", method = RequestMethod.POST)
	public String uploadSoldoutImgPOST(@RequestParam("uploadImg4") MultipartFile file) throws Exception {
		String fileName = null;
		if (!file.isEmpty()) {
			fileName = Commons.convertImgName(file.getOriginalFilename(), service.getLastProdNum() + 1, ImgType.SOLDOUT);
			Commons.resizeImg(file, prodSoldoutImgUploadPath, fileName);
		}
		
		return fileName;
	}
	
	// ------------ 리뷰 좋아요 부분 (여유 생기면 상세 기능 추가할 것임) ------------------- // 
//	@RequestMapping(value = "/update_likecnt", method = RequestMethod.GET)
//	public int addReviewLikeCntGET(@RequestParam("review_num") int review_num) throws Exception {
//		service.addReviewLikeCnt(review_num);
//		
//		return service.getReview(review_num).getReview_likecnt();
//	}
//	
//	@RequestMapping(value = "/cancel_like", method = RequestMethod.GET)
//	public int cancelLikeGET(@RequestParam("review_num") int review_num) throws Exception {
//		service.cancelLike(review_num);
//		
//		return service.getReview(review_num).getReview_likecnt();
//	}
}
