package kh.spring.fongdang.funding.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Product {
	
/*	P_NO            NOT NULL NUMBER        
//	MAKER_NAME      NOT NULL VARCHAR2(200) 
//	CATEGORY_ID     NOT NULL CHAR(2)       
//	P_NAME          NOT NULL VARCHAR2(200) 
//	P_GOAL          NOT NULL NUMBER        
//	P_THUMBNAIL     NOT NULL VARCHAR2(200) 
//	P_SUMMARY       NOT NULL VARCHAR2(300) 
//	P_STORY         NOT NULL CLOB          
//	P_CERTIFICATION          VARCHAR2(200) 
//	START_DAY       NOT NULL TIMESTAMP(6)  
//	END_DAY         NOT NULL DATE          
//	PAYMENT_PLAN    NOT NULL DATE          
//	DELIVERY_DATE   NOT NULL DATE          
//	P_APPROVAL      NOT NULL CHAR(1)       
//	P_REPORT_CNT    NOT NULL NUMBER  
*/	
	private int p_no;            //상품번호
	private String  maker_name;  //메이커명
	private String  category_id; //카테고리ID
	private String  p_name;      //상품이름
	private int p_goal;          //목표금액
	private String  p_thumbnail; //대표이미지
	private String  p_summary;   //상품요약
	private String  p_story;     //상품상세정보
	private String  p_certification;//인증증명서
	private Timestamp start_day;   //펀딩시작일
	private Date end_day;          //펀딩종료일
	private Date payment_plan;     //펀딩예정일
	private Date delivery_date;    //발송예정일
	private String  p_approval;    //판매승인여부
	private int p_report_cnt;      //상품누적신고횟수
	
	
	private String p_thumbnail_file;
	private String p_certification_file;
	private MultipartFile thumbnail_file;
	private MultipartFile certification_file;
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
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_goal() {
		return p_goal;
	}
	public void setP_goal(int p_goal) {
		this.p_goal = p_goal;
	}
	public String getP_thumbnail() {
		return p_thumbnail;
	}
	public void setP_thumbnail(String p_thumbnail) {
		this.p_thumbnail = p_thumbnail;
	}
	public String getP_summary() {
		return p_summary;
	}
	public void setP_summary(String p_summary) {
		this.p_summary = p_summary;
	}
	public String getP_story() {
		return p_story;
	}
	public void setP_story(String p_story) {
		this.p_story = p_story;
	}
	public String getP_certification() {
		return p_certification;
	}
	public void setP_certification(String p_certification) {
		this.p_certification = p_certification;
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
	public Date getPayment_plan() {
		return payment_plan;
	}
	public void setPayment_plan(Date payment_plan) {
		this.payment_plan = payment_plan;
	}
	public Date getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getP_approval() {
		return p_approval;
	}
	public void setP_approval(String p_approval) {
		this.p_approval = p_approval;
	}
	public int getP_report_cnt() {
		return p_report_cnt;
	}
	public void setP_report_cnt(int p_report_cnt) {
		this.p_report_cnt = p_report_cnt;
	}
	public String getP_thumbnail_file() {
		return p_thumbnail_file;
	}
	public void setP_thumbnail_file(String p_thumbnail_file) {
		this.p_thumbnail_file = p_thumbnail_file;
	}
	public String getP_certification_file() {
		return p_certification_file;
	}
	public void setP_certification_file(String p_certification_file) {
		this.p_certification_file = p_certification_file;
	}
	public MultipartFile getThumbnail_file() {
		return thumbnail_file;
	}
	public void setThumbnail_file(MultipartFile thumbnail_file) {
		this.thumbnail_file = thumbnail_file;
	}
	public MultipartFile getCertification_file() {
		return certification_file;
	}
	public void setCertification_file(MultipartFile certification_file) {
		this.certification_file = certification_file;
	}
	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", maker_name=" + maker_name + ", category_id=" + category_id + ", p_name="
				+ p_name + ", p_goal=" + p_goal + ", p_thumbnail=" + p_thumbnail + ", p_summary=" + p_summary
				+ ", p_story=" + p_story + ", p_certification=" + p_certification + ", start_day=" + start_day
				+ ", end_day=" + end_day + ", payment_plan=" + payment_plan + ", delivery_date=" + delivery_date
				+ ", p_approval=" + p_approval + ", p_report_cnt=" + p_report_cnt + ", p_thumbnail_file="
				+ p_thumbnail_file + ", p_certification_file=" + p_certification_file + ", thumbnail_file="
				+ thumbnail_file + ", certification_file=" + certification_file + "]";
	}
	
	
	
	
	
	
	

}
