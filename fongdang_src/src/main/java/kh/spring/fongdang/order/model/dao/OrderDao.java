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
	
	public List<Order> selectOrder(int p_no) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("p_no", p_no);
		List<Order> result = session.selectList("Order.selectOrderOption", map);
		
		return result;
	}
}
