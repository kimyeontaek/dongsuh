package com.ezen.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dongsuh.dao.BrandDAO;
import dongsuh.vo.BrandVO;

@Controller
public class BrandController {
	@Autowired
	SqlSessionTemplate sqlSession;

	/* 브랜드 선택 페이지로 이동 */
	@RequestMapping(value = "/brand.do", method = RequestMethod.GET)
	public ModelAndView brand() {
		ModelAndView mv = new ModelAndView();

		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// 브랜드 이미지 보여주기
		ArrayList<BrandVO> list = dao.getMainList();

		mv.addObject("list", list);
		mv.setViewName("/brand/brandMain");
		return mv;

	}

	/* 브랜드 이미지 선택시 해당 브랜드 주문페이지로 이동 */
	@RequestMapping(value = "/brandSal.do", method = RequestMethod.GET)
	public ModelAndView brandSal(String brandname) {
		ModelAndView mv = new ModelAndView();

		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// 브랜드 주문페이지 보여주기
		BrandVO vo = dao.getResultVO(brandname);
		// 상품목록 보여주기
		ArrayList<BrandVO> list = dao.getItemList(brandname);

		mv.addObject("brandname", brandname);
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		mv.setViewName("/brand/brandSal");

		return mv;
	}

	/* 바로구매하기 버튼 눌렀을때 이동하는 페이지 */
	@RequestMapping(value = "/order.do", method = RequestMethod.POST)
	public ModelAndView order(BrandVO vo) {
		ModelAndView mv = new ModelAndView();

		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		int result = 0;

		for (int i = 0; i < vo.getNames().length; i++) {
			// 바로구매하기 테이블에 상품목록 저장
			result = dao.getInsertOrderResult(vo.getNames()[i],
					vo.getNums()[i], vo.getPrices()[i]);
		}
		// 바로구매하기 목록 보여주기
		ArrayList<BrandVO> list = dao.getOrderListResult();

		// 총 상품금액 계산
		int sum = 0;
		for (int i = 0; i < vo.getPrices().length; i++) {
			sum = (vo.getPrices()[i] * vo.getNums()[i]) + sum;
		}
		// 바로구매하기 테이블 삭제 -> 바로구매하기는 임시로 저장하여 리스트만 출력
		dao.getOrderTruncateResult();
		if (result == 1) {
			mv.addObject("list", list);
			mv.addObject("sum", sum);
			mv.setViewName("/mypage/order");
		}
		return mv;
	}

	/* 장바구니추가 버튼을 눌럿을때 이동하는 페이지 */
	@RequestMapping(value = "/basket_insert.do", method = RequestMethod.POST)
	public ModelAndView basket_insert(BrandVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		int result = 0;
		for (int i = 0; i < vo.getBaname().length; i++) {
			// 장바구니 테이블에 상품목록 저장
			result = dao.getInsertBasketResult(sid, vo.getBaname()[i],
					vo.getBanum()[i], vo.getBaprice()[i]);
		}
		// 바로구매하기 목록 보여주기
		ArrayList<BrandVO> list = dao.getBasketListResult(sid);

		// 총 상품금액 계산
		int sum = 0;
		for (BrandVO arr : list) {
			sum = (arr.getPrice() * arr.getNum()) + sum;
		}
		if (result == 1) {
			mv.addObject("list", list);
			mv.addObject("sum", sum);
			mv.setViewName("/mypage/basket");
		}
		return mv;
	}

	/* 장바구니 페이지로 이동 */
	@RequestMapping(value = "/basket.do", method = RequestMethod.GET)
	public ModelAndView basket(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		int sum = 0;

		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// 장바구니 보여주기
		ArrayList<BrandVO> list = dao.getBasketListResult(sid);
		// 총 판매액 계산
		for (BrandVO arr : list) {
			sum = (arr.getPrice() * arr.getNum()) + sum;
		}

		mv.addObject("list", list);
		mv.addObject("sum", sum);
		mv.setViewName("/mypage/basket");

		return mv;
	}

	/* 상품평 등록 기능 */
	@RequestMapping(value = "/brandSalReply.do", method = RequestMethod.GET)
	@ResponseBody
	public String brandSalReply(BrandVO vo) {
		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// 상품평 등록
		int result = dao.getInsertResult(vo);
		return String.valueOf(result);
	}

	/* 상품평 목록 갱신 */
	@RequestMapping(value = "/brandSalReply_list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray brandSalReply_list(String brandname) {
		JSONArray jarray = new JSONArray();
		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// 상품평 목록 가져오기
		ArrayList<BrandVO> list = dao.getReplyList(brandname);

		/* JSONArray를 이용 */
		for (BrandVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("brandname", brandname);
			obj.put("rno", vo.getRno());
			obj.put("content", vo.getContent());
			obj.put("writer", vo.getWriter());
			obj.put("rdate", vo.getRdate());
			// JSONArray에 입력 후 전달
			jarray.add(obj);
		}
		return jarray;
	}
}