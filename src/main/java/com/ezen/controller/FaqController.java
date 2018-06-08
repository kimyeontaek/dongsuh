package com.ezen.controller;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dongsuh.dao.FaqDAO;
import dongsuh.vo.FaqgonVO;

@Controller
public class FaqController {
	@Autowired
	SqlSessionTemplate sqlSession;

	@RequestMapping(value = "/faq.do", method = RequestMethod.GET)
	public ModelAndView faq() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/faq/faq");
		return mv;
	};

	@RequestMapping(value = "/faqgon.do", method = RequestMethod.GET)
	public ModelAndView faqgon(FaqgonVO vo) {
		ModelAndView mv = new ModelAndView();
		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		ArrayList<FaqgonVO> list = null;
		list = dao.getResultList();

		mv.addObject("list", list);
		mv.setViewName("/faq/faqgon");
		return mv;
	}

	@RequestMapping(value = "/faqform.do", method = RequestMethod.GET)
	public ModelAndView faqform() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/faq/faqform");
		return mv;
	}

	@RequestMapping(value = "/faqgonForm.do")
	public ModelAndView faqgonForm(FaqgonVO vo) {
		ModelAndView mv = new ModelAndView();

		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		int result = dao.getInsertResult(vo);

		if (result == 1) {
			mv.setViewName("redirect:/faqgon.do");
		}
		return mv;
	}

	@RequestMapping(value = "/faqcon.do", method = RequestMethod.GET)
	public ModelAndView faqcon(String no) {
		ModelAndView mv = new ModelAndView();

		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		FaqgonVO vo = dao.getResultVO(no);

		mv.addObject("vo", vo);
		mv.addObject("no", no);
		mv.setViewName("/faq/faqcon");
		return mv;
	}

	@RequestMapping(value = "/faqdel.do", method = RequestMethod.GET)
	public ModelAndView faqdel(FaqgonVO vo) {
		ModelAndView mv = new ModelAndView();
		String page = "";
		int result = 0;

		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);

		result = dao.getDeleteResult(vo);
		if (result == 1) {
			page = "redirect:/faqgon.do";
		}
		mv.setViewName("/faq/faqgon");
		return mv;
	}

	@RequestMapping(value = "/faqformup.do")
	public ModelAndView faqformup(String no) {
		ModelAndView mv = new ModelAndView();

		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		FaqgonVO vo = dao.getResultVO(no);

		mv.addObject("vo", vo);
		mv.addObject("no", no);

		mv.setViewName("/faq/faqformup");
		return mv;
	}

	@RequestMapping(value = "/faq_update_check.do", method = RequestMethod.GET)
	public ModelAndView faq_update_check(FaqgonVO vo, String no)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = 0;

		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		result = dao.getUpdateresult(vo, no);

		if (result == 1) {

			mv.setViewName("redirect:/faqgon.do");
		}

		return mv;
	}
}
