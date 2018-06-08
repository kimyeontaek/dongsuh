package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dongsuh.dao.IndexDAO;
import dongsuh.dao.LoginDAO;
import dongsuh.vo.LoginVO;
import dongsuh.vo.MemberVO;

@Controller
public class IndexController {
	@Autowired
	SqlSessionTemplate sqlSession;

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/index");
		return mv;
	}

	@RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	public ModelAndView login_check(MemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
		System.out.println("1" + vo.getId());
		int result = dao.getLoginResult(vo);

		if (result == 1) {
			session.setAttribute("sid", vo.getId());
			mv.setViewName("/index");
		} else {
			mv.setViewName("/index");
		}

		return mv;
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		String sid = (String) session.getAttribute("sid");
		if (sid != null)
			session.invalidate();

		return "/index";
	}

	@RequestMapping(value = "/notLogin.do", method = RequestMethod.GET)
	public ModelAndView notLogin() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/login/notLogin");
		return mv;
	}

	@RequestMapping(value = "/idFindResult.do", method = RequestMethod.POST)
	public ModelAndView idFindResult(LoginVO vo) {
		ModelAndView mv = new ModelAndView();
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		String result = dao.getIdResult(vo);

		if (result != null) {
			mv.addObject("result", result);
			mv.setViewName("/login/idFindResult");
		} else if (result == null) {
			mv.setViewName("/index");
		}

		return mv;
	}

	@RequestMapping(value = "/passFindResult.do", method = RequestMethod.POST)
	public ModelAndView passFindResult(LoginVO vo) {
		ModelAndView mv = new ModelAndView();
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		String result = dao.getPassResult(vo);

		if (result != null) {
			mv.addObject("result", result);
			mv.setViewName("/login/passFindResult");
		} else if (result == null) {
			mv.setViewName("/index");
		}

		return mv;
	}
}