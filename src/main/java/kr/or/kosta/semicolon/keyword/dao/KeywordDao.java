package kr.or.kosta.semicolon.keyword.dao;

import java.util.HashMap;
import java.util.List;

import kr.or.kosta.semicolon.common.KeywordParameter;
import kr.or.kosta.semicolon.gpurchase.domain.Gpurchase;
import kr.or.kosta.semicolon.gpurchase.domain.GpurchaseInfo;
import kr.or.kosta.semicolon.keyword.domain.Keyword;

/**
 * @packgename   kr.or.kosta.semicolon.keyword.dao
 * @filename         KeywordDao.java
 * @author          김미소
 * @since            2017. 11. 21.
 * @see
 *
 * == Modification Infomation (수정 이력) ==
 * 
 *   DATE        AUTHOR       NOTE
 * --------      -----------   ---------------------------------------
 * 2017. 11. 21.      김미소         최초 생성
 * 2017. 11. 24.	  박연주		 selectName 추가
 *
 */
public interface KeywordDao {

	public int insert(Keyword keyword);
	
	public List<GpurchaseInfo> listByKeyword(KeywordParameter keyword);
	
	public List<String> selectName(int goodsNo) throws Exception;
	
	public List<String> autoComplete(String keyword);
	
	public List<String> listByCount();
	
}
