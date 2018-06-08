package dongsuh.dao;

import java.util.ArrayList;

import dongsuh.vo.BrandVO;

public interface BrandDAO {

	/* 브랜드 선택페이지 보여주기 */
	public ArrayList<BrandVO> getMainList();

	/* 브랜드 주문페이지 보여주기 */
	public BrandVO getResultVO(String brandname);

	/* 상품목록 보여주기 */
	public ArrayList<BrandVO> getItemList(String brandname);

	/* 바로구매하기 테이블에 데이터 추가 */
	public int getInsertOrderResult(BrandVO vo);

	/* 바로구매하기 목록 보여주기 */
	public ArrayList<BrandVO> getOrderListResult();

	/* 바로구매하기 테이블 삭제 */
	public int getOrderTruncateResult();

	/* 장바구니 테이블에 데이터 추가 */
	public int getInsertBasketResult(BrandVO vo, String sid);/* {
		int result = 0;
		try {
			String sql = "insert into basket_table values(sequ_basket.nextval,?,?,?,?)";
			getPreparedStatement(sql);
			for (int i = 0; i < vo.getBaname().length; i++) {
				pstmt.setString(1, sid);
				pstmt.setString(2, vo.getBaname()[i]);
				pstmt.setInt(3, vo.getBanum()[i]);
				pstmt.setInt(4, vo.getBaprice()[i]);
				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/

	/* 장바구니 보여주기 */
	public ArrayList<BrandVO> getBasketListResult(String sid);

	/* 상품평 등록 */
	public int getInsertResult(BrandVO vo);

	/* 상품평 보여주기 */
	public ArrayList<BrandVO> getReplyList(String brandname);
	
}
