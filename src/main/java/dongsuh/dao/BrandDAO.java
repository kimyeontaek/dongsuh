package dongsuh.dao;

import java.util.ArrayList;
import java.util.HashMap;

import dongsuh.vo.BrandVO;

public interface BrandDAO {

	/* 브랜드 선택페이지 보여주기 */
	public ArrayList<BrandVO> getMainList();

	/* 브랜드 주문페이지 보여주기 */
	public BrandVO getResultVO(String brandname);

	/* 상품목록 보여주기 */
	public ArrayList<BrandVO> getItemList(String brandname);

	/* 바로구매하기 테이블에 데이터 추가 */
	public int getInsertOrderResult(String name, int num, int price);

	/* 바로구매하기 목록 보여주기 */
	public ArrayList<BrandVO> getOrderListResult();

	/* 바로구매하기 테이블 삭제 */
	public int getOrderTruncateResult();

	/* 장바구니 테이블에 데이터 추가 */
	public int getInsertBasketResult(String sid, String baname, int banum,
			int baprice);

	/* 장바구니 보여주기 */
	public ArrayList<BrandVO> getBasketListResult(String sid);

	/* 상품평 등록 */
	public int getInsertResult(BrandVO vo);

	/* 상품평 보여주기 */
	public ArrayList<BrandVO> getReplyList(String brandname);

}
