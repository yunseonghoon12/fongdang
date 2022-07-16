package kh.spring.fongdang.common;


import java.io.Serializable;


/**
 * 페이징 처리 모델
 */	
public class Criteria implements Serializable {

    private int page;               // 현재페이지 번호
    private int pageSize;           // 페이지 사이즈
    private int totalPage;          // 전체페이지수
    private int totalCount;         // 전체데이터카운트
    private String searchKey;       // 검색키
    private String searchValue;     // 검색값
    
    
    public Criteria() {
        this.page = 1;
        this.pageSize = 10;
        this.searchKey = "ALL";
        this.searchValue = "";
    }

    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }

    /**
     * 전체 데이터 카운트를 가지고 전체페이지 수를 계산한다. 페이징 공통함수 사용을 위한 처리
     *
     * @param totalCount
     */
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        int tempPage = totalCount / pageSize;

        if (totalCount % pageSize != 0) tempPage++;
        this.totalPage = tempPage;
    }

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getTotalCount() {
		return totalCount;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", totalCount="
				+ totalCount + ", searchKey=" + searchKey + ", searchValue=" + searchValue + "]";
	}
}

