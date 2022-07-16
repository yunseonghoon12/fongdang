package kh.spring.fongdang.admin.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Sales {
	
	private int p_no;            //상품번호	
	private String  maker_name;  //메이커명
	private String  p_name;      //상품이름
	private String  category_id; //카테고리ID
	private long p_goal;          //목표금액
	private Timestamp start_day;   //펀딩시작일
	private Date end_day;          //펀딩종료일
	private long total_funding_money; //펀딩 누적 금액(총 펀딩금액)
	private int p_goal_percent; //펀딩 달성률
	private long  commission;//수수료
	private long  sales_funding_money;// 정산금액
	
	
	
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getMaker_name() {
		return maker_name;
	}
	public void setMaker_name(String maker_name) {
		this.maker_name = maker_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public long getP_goal() {
		return p_goal;
	}
	public void setP_goal(long p_goal) {
		this.p_goal = p_goal;
	}
	public Timestamp getStart_day() {
		return start_day;
	}
	public void setStart_day(Timestamp start_day) {
		this.start_day = start_day;
	}
	public Date getEnd_day() {
		return end_day;
	}
	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}
	public long getTotal_funding_money() {
		return total_funding_money;
	}
	public void setTotal_funding_money(long total_funding_money) {
		this.total_funding_money = total_funding_money;
	}
	public int getP_goal_percent() {
		return p_goal_percent;
	}
	public void setP_goal_percent(int p_goal_percent) {
		this.p_goal_percent = p_goal_percent;
	}
	public long getCommission() {
		return commission;
	}
	public void setCommission(long commission) {
		this.commission = commission;
	}
	public long getSales_funding_money() {
		return sales_funding_money;
	}
	public void setSales_funding_money(long sales_funding_money) {
		this.sales_funding_money = sales_funding_money;
	}
	@Override
	public String toString() {
		return "Sales [p_no=" + p_no + ", maker_name=" + maker_name + ", p_name=" + p_name + ", category_id="
				+ category_id + ", p_goal=" + p_goal + ", start_day=" + start_day + ", end_day=" + end_day
				+ ", total_funding_money=" + total_funding_money + ", p_goal_percent=" + p_goal_percent
				+ ", commission=" + commission + ", sales_funding_money=" + sales_funding_money + "]";
	}
	
	
	
	
}
