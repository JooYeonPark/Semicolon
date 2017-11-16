package kr.or.kosta.semicolon.gpurchase.dao;

import java.util.List;

import kr.or.kosta.semicolon.common.Params;
import kr.or.kosta.semicolon.gpurchase.domain.Gpurchase;

/**
 * 
 * @packgename   kr.or.kosta.semicolon.gpurchase.dao
 * @filename         gpurchaseDao.java
 * @author          박연주
 * @since            2017. 11. 10.
 * @see				Gpurchase Table의 Dao
 *
 * == Modification Infomation (수정 이력) ==
 * 
 *   DATE        AUTHOR       NOTE
 * --------      -----------   ---------------------------------------
 * 2017. 11. 10.      연주        최초 생성
 *
 *
 */
public interface gpurchaseDao {
	
	public void insert(Gpurchase gpurchase) throws Exception;
	
	public List<Gpurchase> listall() throws Exception;
	
	public Gpurchase select(int gpurchaseNo) throws Exception;
	
	public void update(Gpurchase gpurchase) throws Exception;
	
	public void delete(int gpurchaseNo) throws Exception;
	
	public List<Gpurchase> listAll(Params params) throws Exception;
	
	public int listCount() throws Exception;

}