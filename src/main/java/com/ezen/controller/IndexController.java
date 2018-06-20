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
		// id, pass 체크
		int result = dao.getLoginResult(vo);
		// 로그인 성공여부 체크
		if (result == 1) {
			// 로그인 성공
			session.setAttribute("sid", vo.getId());
			mv.setViewName("/index");
		} else {
			mv.setViewName("/index");
		}

		return mv;
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		String sid = (String) session.getAttribute("sid");
		if (sid != null)
			// 세션 제거
			session.invalidate();

		return "/index";
	}

	@RequestMapping(value = "/notLogin.do", method = RequestMethod.GET)
	public ModelAndView notLogin() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/login/notLogin");
		return mv;
	}

	// 아이디 찾기
	@RequestMapping(value = "/idFindResult.do", method = RequestMethod.POST)
	public ModelAndView idFindResult(LoginVO vo) {
		ModelAndView mv = new ModelAndView();
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		// 입력내용과 DB 비교하여 id값 가져오기
		String result = dao.getIdResult(vo);
		
		if (result != null) {
			// 조건에 만족하는 id가 있으면
			mv.addObject("result", result);
			mv.setViewName("/login/idFindResult");
		} else if (result == null) {
			// 조건에 만족하는 id가 없으면
			mv.setViewName("/index");
		}

		return mv;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/passFindResult.do", method = RequestMethod.POST)
	public ModelAndView passFindResult(LoginVO vo) {
		ModelAndView mv = new ModelAndView();
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		// 입력내용과 DB 비교하여 pass값 가져오기
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