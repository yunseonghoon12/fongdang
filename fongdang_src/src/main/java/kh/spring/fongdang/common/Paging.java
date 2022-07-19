package kh.spring.fongdang.common;

import org.springframework.stereotype.Component;

@Component
public class Paging {
	public int calcTotalPage(int totalCnt, int pageSize) {
		return (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
	}

	public int calcStartPage(int currentPage, int pageBlock) {
		if (currentPage % pageBlock == 0) {
			return ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			return (currentPage / pageBlock) * pageBlock + 1;
		}
	}

	public int calcEndPage(int startPage, int pageBlock, int totalPageCnt) {
		if ((startPage + pageBlock - 1) > totalPageCnt) {
			return totalPageCnt;
		} else {
			return startPage + pageBlock - 1;
		}
	}

	public int calcStartRnum(int currentPage, int pageSize) {
		return (currentPage - 1) * pageSize + 1;
	}

	public int calcEndRnum(int startRnum, int pageSize, int totalCnt) {
		if ((startRnum + pageSize - 1) > totalCnt) {
			return totalCnt;
		} else {
			return startRnum + pageSize - 1;
		}
	}
}
