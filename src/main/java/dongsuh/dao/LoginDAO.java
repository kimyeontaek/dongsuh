package dongsuh.dao;

import dongsuh.vo.LoginVO;

public interface LoginDAO {
	/* 아이디 찾기 */
	public String getIdResult(LoginVO vo);

	/* 비밀번호 찾기 */
	public String getPassResult(LoginVO vo);
}