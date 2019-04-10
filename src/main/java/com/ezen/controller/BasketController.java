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


	@RequestMapping(value = "/basket_check.do", method = RequestMethod.POST)
	public String basket_check(BasketVO vo) {
		String page = "";
		int result = 0;
		BasketDAO dao = sqlSession.getMapper(BasketDAO.class);
		// �꽑�깮 �궘�젣
		for(int i=0; i<vo.getBasketCheckbox().length; i++){
			result = dao.getSelectDeleteResult(vo.getBasketCheckbox()[i]);
		}
		// �꽑�깮 �궘�젣 �씠�썑 basket.do瑜� �떎�떆 遺덈윭�삩�떎
		if (result == 1) {
			page = "redirect:/basket.do";
		}

		return page;
	}

	/* 二쇰Ц�궡�뿭�쑝濡� �씠�룞 */
	@RequestMapping(value = "/order_list.do", method = RequestMethod.GET)
	public ModelAndView basket(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");

		BasketDAO dao = sqlSession.getMapper(BasketDAO.class);
		// 二쇰Ц�궡�뿭 蹂댁뿬二쇨린
		ArrayList<BasketVO> list = dao.getOrderListResult(sid);

		mv.addObject("list", list);
		mv.setViewName("/mypage/order_list");

		return mv;
	}

	/* �긽�뭹�쓣 二쇰Ц �뻼�쓣 �븣 */
	@RequestMapping(value = "/basket_order_list.do", method = RequestMethod.POST)
	public ModelAndView basket_order_list(BasketVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		int result = 0;

		BasketDAO dao = sqlSession.getMapper(BasketDAO.class);
		// 二쇰Ц�궡�뿭 �뀒�씠釉붿뿉 異붽�
		for(int i=0; i<vo.getHname().length; i++){
			result = dao.getOrderList(sid, vo.getHname()[i], vo.getHnum()[i], vo.getHprice()[i]);
		}
		// 湲곗〈 �옣諛붽뎄�땲 紐⑸줉 �궘�젣
		dao.getTruncate();
		// 二쇰Ц�궡�뿭 紐⑸줉 蹂댁뿬二쇨린
		ArrayList<BasketVO> list = dao.getOrderListResult(sid);

		if (result == 1) {
			mv.addObject("list", list);
			mv.setViewName("/mypage/order_list");
		}
		return mv;
	}
}
