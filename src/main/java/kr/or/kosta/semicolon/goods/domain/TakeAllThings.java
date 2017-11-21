package kr.or.kosta.semicolon.goods.domain;
/**
 * 
 * @packgename  	 kr.or.kosta.semicolon.goods.domain
 * @filename         All.java
 * @author           김미소
 * @since            2017. 11. 18.
 * @see              상품 등록시 들어오는 모든 데이터를 받기위한 Domain Class
 *
 * == Modification Infomation (수정 이력) ==
 * 
 *   DATE        AUTHOR       NOTE
 * --------      -----------   ---------------------------------------
 * 2017. 11. 18.      김미소         최초 생성
 *
 *
 */
public class TakeAllThings {
	
	// 상품 
	private int goodsNo;
	private String name;
	private int price;
	private String detail;
	private String frontImg;
	private String toggleImg;
	private String color;
	
	//상하의 공통
	private String types[];
	private String sizes[];
	private Double fullLength[];
	
	// 상의 사이즈 
	private int topsNo;
	private Double sleeveLength[];
	
	
	//하의 사이즈
	private int bottomNo;
	private Double waist[];
	private Double rise[];
	private Double hip[];
	private Double thigh[];
	
	//키워드
	private int keywordNo;
	private String keywordName[];
	
	// 이미지 
	private int imageNo;
	private String attachFile;
	
	public TakeAllThings() {}

	public TakeAllThings(int goodsNo, String name, int price, String detail, String frontImg, String toggleImg,
			String color, String[] types, String[] sizes, Double[] fullLength, int topsNo, Double[] sleeveLength,
			int bottomNo, Double[] waist, Double[] rise, Double[] hip, Double[] thigh, int keywordNo,
			String[] keywordName, int imageNo, String attachFile) {
		super();
		this.goodsNo = goodsNo;
		this.name = name;
		this.price = price;
		this.detail = detail;
		this.frontImg = frontImg;
		this.toggleImg = toggleImg;
		this.color = color;
		this.types = types;
		this.sizes = sizes;
		this.fullLength = fullLength;
		this.topsNo = topsNo;
		this.sleeveLength = sleeveLength;
		this.bottomNo = bottomNo;
		this.waist = waist;
		this.rise = rise;
		this.hip = hip;
		this.thigh = thigh;
		this.keywordNo = keywordNo;
		this.keywordName = keywordName;
		this.imageNo = imageNo;
		this.attachFile = attachFile;
	}


	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFrontImg() {
		return frontImg;
	}

	public void setFrontImg(String frontImg) {
		this.frontImg = frontImg;
	}

	public String getToggleImg() {
		return toggleImg;
	}

	public void setToggleImg(String toggleImg) {
		this.toggleImg = toggleImg;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getTopsNo() {
		return topsNo;
	}

	public void setTopsNo(int topsNo) {
		this.topsNo = topsNo;
	}

	public String[] getTypes() {
		return types;
	}

	public void setTypes(String[] types) {
		this.types = types;
	}

	public String[] getSizes() {
		return sizes;
	}

	public void setSizes(String[] sizes) {
		this.sizes = sizes;
	}

	public Double[] getSleeveLength() {
		return sleeveLength;
	}

	public void setSleeveLength(Double[] sleeveLength) {
		this.sleeveLength = sleeveLength;
	}

	public Double[] getFullLength() {
		return fullLength;
	}

	public void setFullLength(Double[] fullLength) {
		this.fullLength = fullLength;
	}

	public int getBottomNo() {
		return bottomNo;
	}

	public void setBottomNo(int bottomNo) {
		this.bottomNo = bottomNo;
	}

	public Double[] getWaist() {
		return waist;
	}

	public void setWaist(Double[] waist) {
		this.waist = waist;
	}

	public Double[] getRise() {
		return rise;
	}

	public void setRise(Double[] rise) {
		this.rise = rise;
	}

	public Double[] getHip() {
		return hip;
	}

	public void setHip(Double[] hip) {
		this.hip = hip;
	}

	public Double[] getThigh() {
		return thigh;
	}

	public void setThigh(Double[] thigh) {
		this.thigh = thigh;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}

	public int getKeywordNo() {
		return keywordNo;
	}

	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}

	public String[] getKeywordName() {
		return keywordName;
	}

	public void setKeywordName(String[] keywordName) {
		this.keywordName = keywordName;
	}

	@Override
	public String toString() {
		return "TakeAllThings [goodsNo=" + goodsNo + ", name=" + name + ", price=" + price + ", detail=" + detail
				+ ", frontImg=" + frontImg + ", toggleImg=" + toggleImg + ", color=" + color + ", topsNo=" + topsNo
				+ ", types=" + types + ", sizes=" + sizes + ", sleeveLength=" + sleeveLength + ", fullLength="
				+ fullLength + ", imageNo=" + imageNo + ", attachFile=" + attachFile + "]";
	}
	
	
	

}
