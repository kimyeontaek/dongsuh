package dongsuh.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dongsuh.vo.BasketVO;
import dongsuh.vo.BrandVO;

public interface BasketDAO {

	/* 장바구니 선택삭제 */
	public int getSelectDeleteResult(BasketVO vo);

	/* 주문내역 테이블에 추가 */
	public int getOrderList(BasketVO vo, String sid);

	/* 장바구니 목록 삭제 */
	public int getTruncate();/* {
		int result = 0;
		try {
			String sql = "truncate table basket_table";
			getPreparedStatement(sql);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/

	/* 주문내역 목록 보여주기 */
	public ArrayList<BasketVO> getOrderListResult(String sid);

}