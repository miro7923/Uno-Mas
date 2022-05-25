package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.CartVO;

public interface CartDAO {

    public int insert(CartVO vo);				// 장바구니 추가
    public List<CartVO> listCart(int user_num);	// 장바구니 목록
    public void delete(int cart_num);				// 장바구니 개별 삭제
    public void deleteAll(int user_num);			// 장바구니 비우기
    public int countCart(int user_num, int prod_num); // 장바구니 상품 갯수 확인
    public int sumMoney(int user_num);			// 장바구니 금액 합계
    public int updateCart(CartVO vo);			// 장바구니 상품수량 변경 
    public void modifyCart(CartVO vo);			// 장바구니 수정
    public CartVO getSelectedItem(int cart_num); // 회원이 주문하려고 선택한 상품 가져오는 메서드
    public void deleteByUserNum(int user_num, int prod_num); //회원번호랑 상품번호로 카트 상품 삭제
}
