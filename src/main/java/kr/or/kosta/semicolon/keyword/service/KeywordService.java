package kr.or.kosta.semicolon.keyword.service;

import java.util.List;

import kr.or.kosta.semicolon.goods.domain.Goods;
import kr.or.kosta.semicolon.gpurchase.domain.Gpurchase;
import kr.or.kosta.semicolon.keyword.domain.Keyword;

public interface KeywordService {

	public int insert(Keyword keyword);
	
	public List<Gpurchase> listByKeyword(String keyword);
	
	public List<String> autoComplete(String keyword);
}
