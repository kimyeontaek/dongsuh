package dongsuh.dao;

import java.util.ArrayList;

import dongsuh.vo.MemberVO;

public interface MemberDAO {

	public int getInsertResult(MemberVO vo);
	
	public int getIdCheckResult(String id);
	
	public ArrayList<MemberVO> getResultList();

	public MemberVO getUpdateResultVO(String sid);

	public int getUpdateNameResultVO(MemberVO vo, String sid);

	public int getUpdatePassResultVO(MemberVO vo, String sid);

}
