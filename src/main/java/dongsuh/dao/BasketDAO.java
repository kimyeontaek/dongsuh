package dongsuh.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dongsuh.vo.BasketVO;
import dongsuh.vo.BrandVO;

public interface BasketDAO {

	/* 장바구니 선택삭제 */
	public int getSelectDeleteResult(String check);

	/* 주문내역 테이블에 추가 */
	public int getOrderList(String sid, String hname, int hnum, int hprice);

	/* 장바구니 목록 삭제 */
	public int getTruncate();

	/* 주문내역 목록 보여주기 */
	public ArrayList<BasketVO> getOrderListResult(String sid);

}