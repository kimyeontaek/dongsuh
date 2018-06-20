package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dongsuh.dao.BasketDAO;
import dongsuh.dao.MemberDAO;
import dongsuh.vo.MemberVO;

@Controller
public class JoinController {
	@Autowired
	SqlSessionTemplate sqlSession;

	@RequestMapping(value = "/join_check.do", method = RequestMethod.GET)
	public ModelAndView join_check() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/join/join_check");
		return mv;
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/join/join");
		return mv;
	}

	@RequestMapping(value = "/join_controller.do", method = RequestMethod.POST)
	public ModelAndView join_controller(MemberVO vo) {
		ModelAndView mv = new ModelAndView();

		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.getInsertResult(vo);

		if (result == 1) {
			mv.setViewName("/index");
		}

		return mv;
	}

	@RequestMapping(value = "/id_check.do", method = RequestMethod.POST)
	@ResponseBody
	public String id_check(String id) {

		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.getIdCheckResult(id);

		return String.valueOf(result);
	}

	@RequestMapping(value = "/join_update_select.do", method = RequestMethod.GET)
	public ModelAndView join_update_select() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/join/join_update_select");
		return mv;
	}

	@RequestMapping(value = "/join_update_pass.do", method = RequestMethod.GET)
	public ModelAndView join_update_pass() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/join/join_update_pass");
		return mv;
	}

	@RequestMapping(value = "/join_update_information.do", method = RequestMethod.GET)
	public ModelAndView join_update_information(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String sid = (String) session.getAttribute("sid");
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		MemberVO vo = dao.getUpdateResultVO(sid);

		mv.addObject("vo", vo);
		mv.setViewName("/join/join_update_information");
		return mv;
	}

	@RequestMapping(value = "/join_update_name.do", method = RequestMethod.POST)
	public ModelAndView join_update_name(MemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String sid = (String) session.getAttribute("sid");
		String name = vo.getName();
		String email = vo.getEmail();
		String phone = vo.getPhone();
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.getUpdateNameResultVO(sid, name, email, phone);

		if (result == 1) {
			mv.setViewName("/index");
		}
		return mv;
	}

	@RequestMapping(value = "/join_update_pass_n.do", method = RequestMethod.POST)
	public ModelAndView join_update_pass_n(MemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String sid = (String) session.getAttribute("sid");
		
		String pass = vo.getPass();

		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.getUpdatePassResultVO(sid, pass);

		if (result == 1) {
			mv.setViewName("/index");
		}
		return mv;
	}

}
