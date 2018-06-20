package dongsuh.dao;

import java.util.ArrayList;

import dongsuh.vo.MemberVO;

public interface MemberDAO {

	public int getInsertResult(MemberVO vo);
	
	public int getIdCheckResult(String id);
	
	public ArrayList<MemberVO> getResultList();

	public MemberVO getUpdateResultVO(String sid);

	public int getUpdateNameResultVO(String sid, String name, String email, String phone);

	public int getUpdatePassResultVO(String sid, String pass);

}
