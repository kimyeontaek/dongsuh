package com.ezen.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
public class CsBoardController {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	ServletContext context;

	// 고객 문의 (CsForm.jsp)로 이동
	@RequestMapping(value = "/csForm.do", method = RequestMethod.GET)
	public ModelAndView csForm(CsBoardVO vo) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/csForm/csForm");
		return mv;
	}

	// Form 정보 인서트하고 (csBoard_list)로 리다이랙트.
	@RequestMapping(value = "/cs_form_controller.do", method = RequestMethod.POST)
	public ModelAndView cs_form_controller(CsBoardVO vo,
			HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();
		// 파일 업로드
		String fname = vo.getFile().getOriginalFilename();// 파일 이름 가져오기

		if (!fname.equals("")) {
			// 파일 업로드 시작
			UUID uuid = UUID.randomUUID();// 랜덤코드 발생

			String rfname = uuid.toString() + "_" + fname; // 파일이름에 랜덤코드를 붙여줌
			String path = context.getRealPath("/upload/" + rfname); // 저장할 위치

			FileOutputStream fos = new FileOutputStream(path);// 컨트롤러(서버)에 있는
																// 파일을 실제 폴더에
																// 저장하기
			fos.write(vo.getFile().getBytes());
			fos.close();

			vo.setFname(fname);
			vo.setRfname(rfname);
		}else if(fname.equals("")){
			vo.setFname("no-file");
			vo.setRfname("no-rfile");
		}
		// DB에 insert 작업 진행
		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		int result = dao.getInsertResult(vo);

		if (result == 1) {
			mv.setViewName("redirect:/csBoard_list.do");
		}

		return mv;

	}

	// //정보 받아서 sid list에 넘겨주기
	@RequestMapping(value = "/csBoard_list.do", method = RequestMethod.GET)
	public ModelAndView csBoard_list(CsBoardVO vo, String no, String rpage,
			String reply, String serch_word, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String sid = (String) session.getAttribute("sid");
		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		ArrayList<CsBoardVO> list = null;

		// 페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5; // 한페이지당 게시물 수
		int reqPage = 1; // 요청페이지
		int pageCount = 1; // 전체 페이지 수
		int dbCount = dao.execSidCount(sid); // DB에서 가져온 전체 행수
		// 총 페이지 수 계산
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		// 요청 페이지 계산
		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else {
			startCount = 1;
			endCount = 5;
		}
		list = dao.getResultList2(startCount, endCount, sid);

		mv.addObject("reply", reply);
		mv.addObject("dbCount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("no", no);
		mv.addObject("list", list);
		mv.setViewName("/csBoard/csBoard_list");
		return mv;
	}

	// 하나의 row 가져와서 내용보기
	@RequestMapping(value = "/csBoard_content.do", method = RequestMethod.GET)
	public ModelAndView csBoard_content_controller(String no, String rpage) {
		ModelAndView mv = new ModelAndView();

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		CsBoardVO vo = dao.getResultVO(no);
		mv.addObject("rpage", rpage);
		mv.addObject("no", no);
		mv.addObject("vo", vo);
		mv.setViewName("/csBoard/csBoard_content");
		return mv;
	}

	// 수정하기로 이동
	@RequestMapping(value = "/csBoard_update.do", method = RequestMethod.POST)
	public ModelAndView csBoard_update(String no, String rpage) {
		ModelAndView mv = new ModelAndView();

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		CsBoardVO vo = dao.getResultVO(no);
		// 엔터 노출 변경
		String content = vo.getContent().replaceAll("<br>", "\r\n");

		mv.addObject("content", content);
		mv.addObject("rpage", rpage);
		mv.addObject("no", no);
		mv.addObject("vo", vo);
		mv.setViewName("/csBoard/csBoard_update");
		return mv;
	}

	// 수정 폼 > 리스트로 이동.
	@RequestMapping(value = "/csBoard_update_controller.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView csBoard_update_controller(CsBoardVO vo,
			String no, String file_check) throws Exception {
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
			mv.setViewName("redirect:/csBoard_list.do");
		}
		return mv;
	}

	// 삭제하기로 이동

	@RequestMapping(value = "/csBoard_delete.do", method = RequestMethod.GET)
	public ModelAndView csBoard_delete(String no, String fname, String rpage) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("no", no);
		mv.addObject("fname", fname);
		mv.addObject("rpage", rpage);
		mv.setViewName("/csBoard/csBoard_delete");
		return mv;
	}

	// 삭제 폼
	@RequestMapping(value = "/csBoard_delete_controller.do", method = RequestMethod.POST)
	public String csBoard_delete_controller(CsBoardVO vo, String no) {

		String page = "";
		int result = 0;

		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		// 1.rfname 값을 db에서 가져오기(dao.delete실행전)
		String rfname = dao.getRfnameResult(no);
		result = dao.getDeleteResult(vo);

		// 2.upload 폴더 경로 가져오기(ServletContext를 이용)

		String path = context.getRealPath("/upload/" + rfname);

		if (result == 1) {
			// 3.파일이 존재하면 삭제!
			File file = new File(path);
			if (file.exists()) {
				file.delete();
			}
			page = "redirect:/csBoard_list.do";
		}
		return page;
	}

	// 선택삭제 폼
	@RequestMapping(value = "/csForm_select_controller.do", method = RequestMethod.POST)
	public String csForm_select_controller(CsBoardVO vo, String no) {
		// vo.getCsBoard_checkbox();

		String page = "";
		int result = 0;
		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		// 1.rfname 값을 db에서 배열로 가져오기(dao.delete실행전)
		ArrayList<String> rfname = dao.getRfnameResult2(vo);
		result = dao.getSelectDeleteResult(vo);

		for (String list : rfname) {
			// 2.upload 폴더 경로 가져오기(ServletContext를 이용)
			String path = context.getRealPath("/upload/" + list);
			if (result == 1) {
				// 3.파일이 존재하면 삭제!
				File file = new File(path);
				if (file.exists()) {
					file.delete();
				}
				page = "redirect:/csBoard_list.do";
			}
		}
		return page;
	}

	/* 아이디 중복체크 */
	@RequestMapping(value = "/name_check.do", method = RequestMethod.POST)
	@ResponseBody
	public String name_check(String id) {
		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		int result = dao.getIdCheckResult(id);

		return String.valueOf(result);
	}

	// 게시판 검색해서 리스트 보내기

	@RequestMapping(value = "/cs_serch_controller.do", method = RequestMethod.GET)
	public ModelAndView csBoard_serch_controller(String serch_word,
			String rpage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		CsBoardDAO dao = sqlSession.getMapper(CsBoardDAO.class);
		ArrayList<CsBoardVO> list = null;

		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = dao.execSerchCount(serch_word, sid);
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

		list = dao.getSerchResultList(startCount, endCount, serch_word, sid);

		mv.addObject("dbCount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("list", list);
		mv.addObject("serch_word", serch_word);
		mv.setViewName("/csBoard/csBoard_serchList");

		return mv;
	}

}
