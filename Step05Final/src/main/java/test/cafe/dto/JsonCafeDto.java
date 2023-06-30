package test.cafe.dto;

import java.util.List;

public class JsonCafeDto {
	private List<CafeDto> list;
	private int pageNum;
	private int startPageNum;
	private int endPageNum;
	private int totalPageCount;
	
	public JsonCafeDto() {}

	public JsonCafeDto(List<CafeDto> list, int pageNum, int startPageNum, int endPageNum, int totalPageCount) {
		super();
		this.list = list;
		this.pageNum = pageNum;
		this.startPageNum = startPageNum;
		this.endPageNum = endPageNum;
		this.totalPageCount = totalPageCount;
	}

	public List<CafeDto> getList() {
		return list;
	}

	public void setList(List<CafeDto> list) {
		this.list = list;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
}