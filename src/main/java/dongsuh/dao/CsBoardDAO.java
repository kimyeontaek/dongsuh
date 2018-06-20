package dongsuh.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import dongsuh.vo.CsBoardVO;

public interface CsBoardDAO {

	/* 인서트 작업 */
	public int getInsertResult(CsBoardVO vo);

	/* 답변 인서트 작업 (답변텍스트가 있을 경우) */
	public int getReplyInsertResult(CsBoardVO vo, String no);

	/* 답변 인서트 작업 (답변텍스트가 없을 경우) */
	public int getNullReplyInsertResult(CsBoardVO vo, String no);

	/* 전체 리스트 출력 */
	public ArrayList<CsBoardVO> getResultList();

	/* 제목눌러서 문의 상세보기 - 한 개의 Row 가져오기 */
	public CsBoardVO getResultVO(String no);

	/* 수정하기 */
	public int getUpdateresult(CsBoardVO vo);

	/* 게시판 수정하기 - fname과 rfname은 수정하지 않는다. */
	public int getUpdateresultNoFile(CsBoardVO vo);

	// 삭제하기
	public int getDeleteResult(CsBoardVO vo);

	// fname, rfname 삭제하기
	public int getUpdateresultFname(CsBoardVO vo);

	/* 삭제 시 rfname 가져오기 */
	public String getRfnameResult(String no);

	/* 선택 삭제시 rfname 배열로 가져오기 */
	public ArrayList<String> getRfnameResult2(CsBoardVO vo);

	/* 선택 삭제하기 */
	public int getSelectDeleteResult(String check_no);
	
	/* 선택 삭제하기2 */
	public int getSelectDeleteResult2(String check_no);

	/* 전체 카운트 가져오기 */
	public int execTotalCount();

	/* sid 카운트 가져오기 */
	public int execSidCount(String sid);

	/* 검색된 카운트 가져오기 */
	public int execSerchCount(String serch_word, String sid);

	/* 검색된 카운트 가져오기_관리자 */
	public int execSerchCount2(String serch_word);

	/* admin 전체 리스트 */
	public ArrayList<CsBoardVO> getAllResultList(int startCount, int endCount);

	/* 개인(sid) 전체 리스트 */
	public ArrayList<CsBoardVO> getResultList2(int startCount, int endCount,
			String sid);

	// ID 중복체크
	public int getIdCheckResult(String id);

	// 게시판 검색하기 리스트 셀랙트
	public ArrayList<CsBoardVO> getSerchResultList(int startCount,
			int endCount, String serch_word, String sid);

	// 게시판 검색하기 리스트 셀랙트_관리자
	public ArrayList<CsBoardVO> getSerchResultList2(int startCount,
			int endCount, String serch_word);

}