package com.ezen.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dongsuh.dao.CsBoardDAO;
import dongsuh.vo.CsBoardVO;

@Controller
public class CsAdminController {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	ServletContext context;

	// 정보 받아서 admin list에 넘겨주기
	@RequestMapping(value = "/csAdminBoard_list.do", method = RequestMethod.GET)
	public ModelAndView csAdminBoard_list(CsBoardVO vo, String no,
			String rpage, String reply, String serch_word) {
		ModelAndView mv = new ModelAndView();

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		ArrayList<CsBoardVO> list = null;

		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = dao.execTotalCount();
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else {
			startCount = 1;
			endCount = 5;
		}
		list = dao.getAllResultList(startCount, endCount);

		mv.addObject("reply", reply);
		mv.addObject("dbCount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("no", no);
		mv.addObject("list", list);
		mv.setViewName("/csAdminBoard/csAdminBoard_list");
		return mv;
	}

	// 하나의 row 가져와서 내용보기
	@RequestMapping(value = "/csAdminBoard_content.do", method = RequestMethod.GET)
	public ModelAndView csAdminBoard_content_controller(String no, String rpage) {
		ModelAndView mv = new ModelAndView();

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		CsBoardVO vo = dao.getResultVO(no);
		// mv.addObject("reply", reply);
		mv.addObject("rpage", rpage);
		// //mv.addObject("rdate",rdate);
		mv.addObject("no", no);
		mv.addObject("vo", vo);
		mv.setViewName("/csAdminBoard/csAdminBoard_content");
		return mv;
	}

	// 수정하기로 이동

	@RequestMapping(value = "/csAdminBoard_update.do", method = RequestMethod.POST)
	public ModelAndView csAdminBoard_update(String no, String rpage) {
		ModelAndView mv = new ModelAndView();

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		CsBoardVO vo = dao.getResultVO(no);
		String content = vo.getContent().replaceAll("<br>", "\r\n");

		mv.addObject("content", content);
		mv.addObject("rpage", rpage);
		mv.addObject("no", no);
		mv.addObject("vo", vo);
		mv.setViewName("/csAdminBoard/csAdminBoard_update");
		return mv;
	}

	// 수정 폼 > 리스트로 이동.
	@RequestMapping(value = "/csAdminBoard_update_controller.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView csAdminBoard_update_controller(
			CsBoardVO vo, String no, String file_check) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		String fname = vo.getFile().getOriginalFilename();
		if (vo.getFile_check().equals("noFile")) {
			result = dao.getUpdateresultNoFile(vo);
		} else if (vo.getFile_check2().equals("noFile2")) {
			result = dao.getUpdateresultFname(vo);
			result = dao.getUpdateresultNoFile(vo);
		} else if (!fname.equals("")) {
			UUID uuid = UUID.randomUUID();
			String rfname = uuid.toString() + "_" + fname;
			String path = context.getRealPath("/upload/" + rfname);

			FileOutputStream fos = new FileOutputStream(path);
			fos.write(vo.getFile().getBytes());
			fos.close();

			vo.setFname(fname);
			vo.setRfname(rfname);

			result = dao.getUpdateresult(vo);
		}
		if (result == 1) {
			mv.addObject("no", no);
			mv.addObject("vo", vo);
			mv.setViewName("redirect:/csAdminBoard_list.do");
		}
		return mv;
	}

	// 삭제하기로 이동
	@RequestMapping(value = "/csAdminBoard_delete.do", method = RequestMethod.GET)
	public ModelAndView csAdminBoard_delete(String no, String fname,
			String rpage) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("no", no);
		mv.addObject("fname", fname);
		mv.addObject("rpage", rpage);
		mv.setViewName("/csAdminBoard/csAdminBoard_delete");
		return mv;
	}

	// 삭제 폼
	@RequestMapping(value = "/csAdminBoard_delete_controller.do", method = RequestMethod.POST)
	public String csAdminBoard_delete_controller(CsBoardVO vo, String no) {

		String page = "";
		int result = 0;

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		String rfname = dao.getRfnameResult(no);
		result = dao.getDeleteResult(vo);

		String path = context.getRealPath("/upload/" + rfname);

		if (result == 1) {
			File file = new File(path);
			if (file.exists()) {
				file.delete();
			}
			page = "redirect:/csAdminBoard_list.do";
		}
		return page;
	}

	// 선택삭제 폼
	@RequestMapping(value = "/csAdminForm_select_controller.do", method = RequestMethod.POST)
	public String csForm_select_controller(CsBoardVO vo, String no) {
		String page = "";
		int result = 0;
		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		ArrayList<String> rfname = dao.getRfnameResult2(vo);
		for (int i = 0; i < vo.getCsBoard_checkbox().length; i++) {
			result = dao.getSelectDeleteResult2(vo.getCsBoard_checkbox()[i]);
		}
		for (String list : rfname) {
			String path = context.getRealPath("/upload/" + list);
			if (result == 1) {
				File file = new File(path);
				if (file.exists()) {
					file.delete();
				}
				page = "redirect:/csBoard_list.do";
				return page;
			}
		}
		page = "redirect:/csBoard_list.do";
		return page;
	}

	// 관리자용 답변달기
	@RequestMapping(value = "/csAdminBoard_replyY.do", method = RequestMethod.GET)
	public ModelAndView csAdminBoard_replyY(String no, String rpage) {
		ModelAndView mv = new ModelAndView();

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		CsBoardVO vo = dao.getResultVO(no);

		mv.addObject("rpage", rpage);
		mv.addObject("no", no);
		mv.addObject("vo", vo);
		mv.setViewName("/csAdminBoard/csAdminBoard_replyY");

		return mv;
	}

	// 답변 완료 후 content 로 이동.
	@RequestMapping(value = "/replyY_controller.do")
	public ModelAndView replyY_controller(CsBoardVO vo, String no, String rpage) {
		ModelAndView mv = new ModelAndView();

		String reply;
		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		if (!vo.getReply().equals("")) {
			int result = dao.getReplyInsertResult(vo, no);
			reply = vo.getReply().replaceAll("\r\n", "<br>");
			if (result == 1) {
				mv.addObject("reply", reply);
				mv.addObject("vo", vo);
			}
		} else if (vo.getReply().equals("")) {
			int result = dao.getNullReplyInsertResult(vo, no);
			reply = vo.getReply().replaceAll("\r\n", "<br>");
			if (result == 1) {
				mv.addObject("reply", reply);
				mv.addObject("vo", vo);
			}
		}
		mv.addObject("rpage", rpage);
		mv.addObject("no", no);
		mv.setViewName("redirect:/csAdminBoard_content.do");
		return mv;
	}

	// [admin]게시판 검색해서 리스트 보내기
	@RequestMapping(value = "/csAdmin_serch_controller.do", method = RequestMethod.GET)
	public ModelAndView csAdminBoard_serch_controller(String serch_word,
			String rpage) {
		ModelAndView mv = new ModelAndView();

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		ArrayList<CsBoardVO> list = null;

		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = dao.execSerchCount2(serch_word);
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else {
			startCount = 1;
			endCount = 5;
		}

		list = dao.getSerchResultList2(startCount, endCount, serch_word);

		mv.addObject("dbCount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("list", list);
		mv.addObject("serch_word", serch_word);
		mv.setViewName("/csAdminBoard/csAdminBoard_list");

		return mv;
	}
}