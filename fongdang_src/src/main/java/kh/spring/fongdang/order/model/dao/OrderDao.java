package kh.spring.fongdang.order.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.order.domain.Order;

@Repository
public class OrderDao {
	@Autowired
	private SqlSession session;
	
	public Order selectOption(int p_no, int option_no) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("option_no", option_no);
		Order result = session.selectOne("Order.selectOption", map);
		
		return result;
	}
	
	public List<Order> selectOption() {
		return session.selectList("Funding.selectOption");
	}
}
