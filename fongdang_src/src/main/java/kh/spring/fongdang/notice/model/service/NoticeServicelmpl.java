package kh.spring.fongdang.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.notice.domain.Notice;
import kh.spring.fongdang.notice.model.dao.NoticeDao;

@Service
public class NoticeServicelmpl implements NoticeService {
	@Autowired
	private NoticeDao dao;
	
	@Override
	public List<Notice> noticeList(int startRnum, int entRnum){
		return dao.noticeList(startRnum, entRnum);
	}
	public int deleteNotice(int n_no) {
		return dao.deleteNotice(n_no);
	}
	public int noticeCount() {
		return dao.noticeCount();
	};

}
