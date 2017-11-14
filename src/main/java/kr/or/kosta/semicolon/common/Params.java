package kr.or.kosta.semicolon.common;

/**
 * 
 * @packgename   kr.or.kosta.semicolon.common
 * @filename         Params.java
 * @author          박연주
 * @since            2017. 11. 13.
 * @see			여러 요청 파라미터들을 저장하기 위한 JavaBean
 *
 * == Modification Infomation (수정 이력) ==
 * 
 *   DATE        AUTHOR       NOTE
 * --------      -----------   ---------------------------------------
 * 2017. 11. 13.      kosta         최초 생성
 *
 *
 */
public class Params {
	private int page;         /** 사용자 요청 페이지 */
	private String type;      /** 사용자 검색 유형 */
	private String value;     /** 사용자 검색 값 */
	private int pageSize;     /** 페이지에 출력할 행의 수 */
	private int pageNum;      /** 페이지에 출력할 페이지 수 */
	private String productOrder;
	
	public Params() {
		this(1, null, null, 16, 5, "newProduct");
	}
	
	public Params(int page, String type, String value, int pageSize, int pageNum, String productOrder) {
		this.page = page;
		this.type = type;
		this.value = value;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.productOrder = productOrder;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getValue() {
		return value;
	}
	
	public void setValue(String value) {
		this.value = value;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		if(pageSize < 0 || pageSize > 50){
			this.pageSize = 10;
			return;
		}
		this.pageSize = pageSize;
	}
	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if(pageNum < 0 || pageNum > 20){
			this.pageNum = 10;
			return;
		}
		this.pageNum = pageNum;
	}

	public String getProductOrder() {
		return productOrder;
	}

	public void setProductOrder(String productOrder) {
		this.productOrder = productOrder;
	}

	@Override
	public String toString() {
		return "Params [page=" + page + ", type=" + type + ", value=" + value + ", pageSize=" + pageSize + ", pageNum="
				+ pageNum + ", productOrder=" + productOrder + "]";
	}
	
	
	

	
}
