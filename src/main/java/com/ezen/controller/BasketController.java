package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dongsuh.dao.BasketDAO;
import dongsuh.vo.BasketVO;

@Controller
public class BasketController {
	@Autowired
	SqlSessionTemplate sqlSession;

	/* 선택 삭제시 장바구니 페이지로 다시 이동 */
	@RequestMapping(value = "/basket_check.do", method = RequestMethod.POST)
	public String basket_check(BasketVO vo) {
		String page = "";
		int result = 0;
		BasketDAO dao = sqlSession.getMapper(BasketDAO.class);
		// 선택 삭제
		for(int i=0; i<vo.getBasketCheckbox().length; i++){
			result = dao.getSelectDeleteResult(vo.getBasketCheckbox()[i]);
		}
		// 선택 삭제 이후 basket.do를 다시 불러온다
		if (result == 1) {
			page = "redirect:/basket.do";
		}

		return page;
	}

	/* 주문내역으로 이동 */
	@RequestMapping(value = "/order_list.do", method = RequestMethod.GET)
	public ModelAndView basket(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");

		BasketDAO dao = sqlSession.getMapper(BasketDAO.class);
		// 주문내역 보여주기
		ArrayList<BasketVO> list = dao.getOrderListResult(sid);

		mv.addObject("list", list);
		mv.setViewName("/mypage/order_list");

		return mv;
	}

	/* 상품을 주문 햇을 때 */
	@RequestMapping(value = "/basket_order_list.do", method = RequestMethod.POST)
	public ModelAndView basket_order_list(BasketVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		int result = 0;

		BasketDAO dao = sqlSession.getMapper(BasketDAO.class);
		// 주문내역 테이블에 추가
		for(int i=0; i<vo.getHname().length; i++){
			result = dao.getOrderList(sid, vo.getHname()[i], vo.getHnum()[i], vo.getHprice()[i]);
		}
		// 기존 장바구니 목록 삭제
		dao.getTruncate();
		// 주문내역 목록 보여주기
		ArrayList<BasketVO> list = dao.getOrderListResult(sid);
		
		if (result == 1) {
			mv.addObject("list", list);
			mv.setViewName("/mypage/order_list");
		}
		return mv;
	}
}
