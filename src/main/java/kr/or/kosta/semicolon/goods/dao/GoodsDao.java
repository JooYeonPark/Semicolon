package kr.or.kosta.semicolon.goods.dao;

import java.util.List;

import kr.or.kosta.semicolon.common.Params;
import kr.or.kosta.semicolon.goods.domain.Goods;

/**
 * @packgename   kr.or.kosta.semicolon.goods.dao
 * @filename         GoodsDao.java
 * @author          전세종
 * @since            2017. 11. 10.
 * @see
 *
 * == Modification Infomation (수정 이력) ==
 * 
 *   DATE        AUTHOR       NOTE
 * --------      -----------   ---------------------------------------
 * 2017. 11. 10.      kosta         최초 생성
 * 2017. 11. 11.	  연주				1차 수정
 *
 */
public interface GoodsDao {
	
	public List<Goods> listall();
	
	public int insert(Goods goods);
	
	public Goods select(int goodsNo) throws Exception;
	
	public List<Goods> listAll(Params params) throws Exception;
	
	public int listCount() throws Exception;
}