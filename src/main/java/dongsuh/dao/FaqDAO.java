package dongsuh.dao;

import java.util.ArrayList;

import dongsuh.vo.FaqgonVO;

public interface FaqDAO {

	public int getInsertResult(FaqgonVO vo);

	public ArrayList<FaqgonVO> getResultList();

	public FaqgonVO getResultVO(String no);

	public int getDeleteResult(FaqgonVO vo);

	public String getnoResult(String no);

	public int getUpdateresult(FaqgonVO vo, String no);

}
