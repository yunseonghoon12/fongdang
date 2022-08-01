package kh.spring.fongdang.notice.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.notice.domain.Notice;

@Repository
public class NoticeDao {

	@Autowired
	private SqlSession session;
	
	
	public List<Notice> noticeList(int startRnum, int entRnum){
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRnum", startRnum);
		map.put("entRnum", entRnum);
		
		List<Notice> result = session.selectList("Notice.noticeList", map);
		//result.setSms(session.selectOne("Funding.selectSms", map));
		return result;
		
		
	};
	public int insertNotice(String title, String content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("n_content", content);
		map.put("n_title", title);
		int result = session.insert("Notice.insertNotice",map);
		return result;
	}
	
	public int deleteNotice(int n_no) {
		int result = session.delete("Notice.deleteNotice",n_no);
		return result;
	}
	public int noticeCount() {
		int result = session.selectOne("Notice.noticeCount");
		return result;
	};

}
