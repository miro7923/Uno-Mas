package com.april.unomas.domain;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

// 여러 컨트롤러에서 공통으로 쓸 수 있는 메서드를 모아놓은 클래스
public class Commons {

	// 이미지 용도에 따라 파일명 다르게 설정
	public final static String convertImgName(String name, int num, ImgType type) {
		int idx = name.lastIndexOf(".");
		String ret = null;
		
		switch (type) {
			case DETAIL:
				ret = "detail_" + num + "." + name.substring(idx + 1).toLowerCase();
				break;
			case THUMBNAIL:
				ret = "thumbnail_" + num + "." + name.substring(idx + 1).toLowerCase();
				break;
			case TOP:
				ret = "top_" + num + "." + name.substring(idx + 1).toLowerCase();
				break;
			case SOLDOUT:
				ret = "soldout_" + num + "." + name.substring(idx + 1).toLowerCase();
				break;
			case REVIEW:
				ret = "review_" + num + "." + name.substring(idx + 1).toLowerCase();
				break;
		}
		
		return ret;
	}
	
	public final static void resizeImg(MultipartFile file, String filePath, String fileName) throws IOException {
		// 이미지 읽어오기
		BufferedImage inputImg = ImageIO.read(file.getInputStream());
		
		// 이미지 가로세로 길이 측정
		int originWidth = inputImg.getWidth();
		int originHeight = inputImg.getHeight();
		
		// 변경할 가로 길이
		int newWidth = 360;
		
		if (originWidth > newWidth) {
			// 기존 이미지 비율을 유지하여 세로길이 설정
			int newHeight = (originHeight * newWidth) / originWidth;
			
			// 이미지 품질 설정         
			// Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
			// Image.SCALE_FAST : 이미지 부드러움보다 속도 우선
			// Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
			// Image.SCALE_SMOOTH : 속도보다 이미지 부드러움을 우선
			// Image.SCALE_AREA_AVERAGING : 평균 알고리즘 사용
			Image resizeImg = inputImg.getScaledInstance(newWidth, newHeight, Image.SCALE_FAST);
			BufferedImage newImg = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
			Graphics graphics = newImg.getGraphics();
			graphics.drawImage(resizeImg, 0, 0, null);
			graphics.dispose();
			
			// 이미지 저장
			File newFile = new File(filePath, fileName);
			ImageIO.write(newImg, fileName.substring(fileName.lastIndexOf(".") + 1), newFile);
		}
		else {
			// 이미지 저장
			File newFile = new File(filePath, fileName);
			FileCopyUtils.copy(file.getBytes(), newFile);
		}
	}
}
