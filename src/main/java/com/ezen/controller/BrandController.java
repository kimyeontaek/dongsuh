package com.ezen.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dongsuh.dao.BrandDAO;
import dongsuh.vo.BrandVO;
//ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
@Controller
public class BrandController {
	@Autowired
	SqlSessionTemplate sqlSession;

	/* 釉뚮옖�뱶 �꽑�깮 �럹�씠吏�濡� �씠�룞 */
	@RequestMapping(value = "/brand.do", method = RequestMethod.GET)
	public ModelAndView brand() {
		ModelAndView mv = new ModelAndView();

		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// 釉뚮옖�뱶 �씠誘몄� 蹂댁뿬二쇨린
		ArrayList<BrandVO> list = dao.getMainList();

		mv.addObject("list", list);
		mv.setViewName("/brand/brandMain");
		return mv;

	}

	/* 釉뚮옖�뱶 �씠誘몄� �꽑�깮�떆 �빐�떦 釉뚮옖�뱶 二쇰Ц�럹�씠吏�濡� �씠�룞 */
	@RequestMapping(value = "/brandSal.do", method = RequestMethod.GET)
	public ModelAndView brandSal(String brandname) {
		ModelAndView mv = new ModelAndView();

		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// 釉뚮옖�뱶 二쇰Ц�럹�씠吏� 蹂댁뿬二쇨린
		BrandVO vo = dao.getResultVO(brandname);
		// �긽�뭹紐⑸줉 蹂댁뿬二쇨린
		ArrayList<BrandVO> list = dao.getItemList(brandname);

		mv.addObject("brandname", brandname);
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		mv.setViewName("/brand/brandSal");

		return mv;
	}

	/* 諛붾줈援щℓ�븯湲� 踰꾪듉 �닃���쓣�븣 �씠�룞�븯�뒗 �럹�씠吏� */
	@RequestMapping(value = "/order.do", method = RequestMethod.POST)
	public ModelAndView order(BrandVO vo) {
		ModelAndView mv = new ModelAndView();

		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		int result = 0;

		for (int i = 0; i < vo.getNames().length; i++) {
			// 諛붾줈援щℓ�븯湲� �뀒�씠釉붿뿉 �긽�뭹紐⑸줉 ���옣
			result = dao.getInsertOrderResult(vo.getNames()[i],
					vo.getNums()[i], vo.getPrices()[i]);
		}
		// 諛붾줈援щℓ�븯湲� 紐⑸줉 蹂댁뿬二쇨린
		ArrayList<BrandVO> list = dao.getOrderListResult();

		// 珥� �긽�뭹湲덉븸 怨꾩궛
		int sum = 0;
		for (int i = 0; i < vo.getPrices().length; i++) {
			sum = (vo.getPrices()[i] * vo.getNums()[i]) + sum;
		}
		// 諛붾줈援щℓ�븯湲� �뀒�씠釉� �궘�젣 -> 諛붾줈援щℓ�븯湲곕뒗 �엫�떆濡� ���옣�븯�뿬 由ъ뒪�듃留� 異쒕젰
		dao.getOrderTruncateResult();
		if (result == 1) {
			mv.addObject("list", list);
			mv.addObject("sum", sum);
			mv.setViewName("/mypage/order");
		}
		return mv;
	}

	/* �옣諛붽뎄�땲異붽� 踰꾪듉�쓣 �닃�읉�쓣�븣 �씠�룞�븯�뒗 �럹�씠吏� */
	@RequestMapping(value = "/basket_insert.do", method = RequestMethod.POST)
	public ModelAndView basket_insert(BrandVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		int result = 0;
		for (int i = 0; i < vo.getBaname().length; i++) {
			// �옣諛붽뎄�땲 �뀒�씠釉붿뿉 �긽�뭹紐⑸줉 ���옣
			result = dao.getInsertBasketResult(sid, vo.getBaname()[i],
					vo.getBanum()[i], vo.getBaprice()[i]);
		}
		// 諛붾줈援щℓ�븯湲� 紐⑸줉 蹂댁뿬二쇨린
		ArrayList<BrandVO> list = dao.getBasketListResult(sid);

		// 珥� �긽�뭹湲덉븸 怨꾩궛
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

	/* �옣諛붽뎄�땲 �럹�씠吏�濡� �씠�룞 */
	@RequestMapping(value = "/basket.do", method = RequestMethod.GET)
	public ModelAndView basket(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		int sum = 0;

		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// �옣諛붽뎄�땲 蹂댁뿬二쇨린
		ArrayList<BrandVO> list = dao.getBasketListResult(sid);
		// 珥� �뙋留ㅼ븸 怨꾩궛
		for (BrandVO arr : list) {
			sum = (arr.getPrice() * arr.getNum()) + sum;
		}

		mv.addObject("list", list);
		mv.addObject("sum", sum);
		mv.setViewName("/mypage/basket");

		return mv;
	}

	/* �긽�뭹�룊 �벑濡� 湲곕뒫 */
	@RequestMapping(value = "/brandSalReply.do", method = RequestMethod.GET)
	@ResponseBody
	public String brandSalReply(BrandVO vo) {
		BrandDAO dao = sqlSession.getMapper(BrandDAO.class);
		// �긽�뭹�룊 �벑濡�
		int result = dao.getInsertResult(vo);
		return String.valueOf(result);
	}


}