package kh.spring.fongdang.notice.model.service;

import java.util.List;

import kh.spring.fongdang.notice.domain.Notice;

public interface NoticeService {
	
	public List<Notice> noticeList(int startRnum, int entRnum);
	public List<Notice> noticeAdmin(int startRnum, int entRnum);
	public int insertNotice(String title,String content);
	public int noticeCount();
	public int deleteNotice(int n_no);
}
