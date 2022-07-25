package kh.spring.fongdang.funding.domain;

import java.util.List;

import org.springframework.stereotype.Component;

import kh.spring.fongdang.review.domain.Review;
import kh.spring.fongdang.sms.domain.Sms;

@Component
public class Funding {
	private int p_no;            //상품번호
	private String p_name;      //상품이름
	private int p_goal;          //목표금액
	private String p_thumbnail; //대표이미지
	private String p_summary;   //상품요약
	private String p_story;     //상품상세정보
	private String p_certification;//인증증명서
	private String start_day;   //펀딩시작일
	private String end_day;          //펀딩종료일
	private String payment_plan;     //펀딩예정일
	private String delivery_date;    //발송예정일
	private String p_approval;    //판매승인여부
	private int p_report_cnt;      //상품누적신고횟수
	private int p_sms_cnt;      //상품알림신청자수
	private int supporter; //서포터 수
	private String total_funding_money; //펀딩 누적 금액
	private String p_goal_str; //목표금액 문자열로 나타내기
	private int p_goal_percent; //펀딩 달성률
	private int d_day; //펀딩 남은 일 수
	private String email;
	private String category_name; //카테고리 이름
	private String maker_category; //메이커 종류
	private String maker_logo; //메이커 로고
	private String maker_name;  //메이커명
	private String maker_email; //메이커 이메일
	private String maker_phone; //메이커 전화번호
	private String maker_kakao_channel; //메이커 카카오채널
	private String maker_homepage; //메이커 홈페이지
	private List<Review> review_list; //리뷰 목록
	private Sms sms;
	
//	@Override
//	public String toString() {
//		return "Funding [p_no=" + p_no + ", p_name=" + p_name + ", p_goal=" + p_goal + ", p_thumbnail=" + p_thumbnail
//				+ ", p_summary=" + p_summary + ", p_story=" + p_story + ", p_certification=" + p_certification
//				+ ", start_day=" + start_day + ", end_day=" + end_day + ", payment_plan=" + payment_plan
//				+ ", delivery_date=" + delivery_date + ", p_approval=" + p_approval + ", p_report_cnt=" + p_report_cnt
//				+ ", supporter=" + supporter + ", total_funding_money=" + total_funding_money + ", p_goal_str="
//				+ p_goal_str + ", p_goal_percent=" + p_goal_percent + ", d_day=" + d_day + ", category_name="
//				+ category_name + ", maker_logo=" + maker_logo + ", maker_name=" + maker_name + ", maker_email="
//				+ maker_email + ", maker_phone=" + maker_phone + ", maker_kakao_channel=" + maker_kakao_channel
//				+ ", maker_homepage=" + maker_homepage + ", review_list=" + review_list + "]";
//	}

	@Override
	public String toString() {
		return "Funding [p_no=" + p_no + ", p_name=" + p_name + ", p_goal=" + p_goal + ", p_summary=" + p_summary
				+ ", p_certification=" + p_certification + ", start_day=" + start_day + ", end_day=" + end_day
				+ ", payment_plan=" + payment_plan + ", delivery_date=" + delivery_date + ", p_approval=" + p_approval
				+ ", p_report_cnt=" + p_report_cnt + ", p_sms_cnt=" + p_sms_cnt + ", supporter=" + supporter + ", total_funding_money="
				+ total_funding_money + ", p_goal_str=" + p_goal_str + ", p_goal_percent=" + p_goal_percent + ", d_day="
				+ d_day + ", email=" + email + ", category_name=" + category_name + ",maker_category=" + maker_category + ", maker_logo=" + maker_logo + ", maker_name="
				+ maker_name + ", maker_email=" + maker_email + ", maker_phone=" + maker_phone
				+ ", maker_kakao_channel=" + maker_kakao_channel + ", maker_homepage=" + maker_homepage
				+ ", review_list=" + review_list + ", sms=" + sms + "]";
	}
	
	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
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

	public String getStart_day() {
		return start_day;
	}

	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}

	public String getEnd_day() {
		return end_day;
	}

	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}

	public String getPayment_plan() {
		return payment_plan;
	}

	public void setPayment_plan(String payment_plan) {
		this.payment_plan = payment_plan;
	}

	public String getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(String delivery_date) {
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

	public int getP_sms_cnt() {
		return p_sms_cnt;
	}

	public void setP_sms_cnt(int p_sms_cnt) {
		this.p_sms_cnt = p_sms_cnt;
	}

	public int getSupporter() {
		return supporter;
	}

	public void setSupporter(int supporter) {
		this.supporter = supporter;
	}

	public String getTotal_funding_money() {
		return total_funding_money;
	}

	public void setTotal_funding_money(String total_funding_money) {
		this.total_funding_money = total_funding_money;
	}

	public String getP_goal_str() {
		return p_goal_str;
	}

	public void setP_goal_str(String p_goal_str) {
		this.p_goal_str = p_goal_str;
	}

	public int getP_goal_percent() {
		return p_goal_percent;
	}

	public void setP_goal_percent(int p_goal_percent) {
		this.p_goal_percent = p_goal_percent;
	}

	public int getD_day() {
		return d_day;
	}

	public void setD_day(int d_day) {
		this.d_day = d_day;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getMaker_category() {
		return maker_category;
	}

	public void setMaker_category(String maker_category) {
		this.maker_category = maker_category;
	}

	public String getMaker_logo() {
		return maker_logo;
	}

	public void setMaker_logo(String maker_logo) {
		this.maker_logo = maker_logo;
	}

	public String getMaker_name() {
		return maker_name;
	}

	public void setMaker_name(String maker_name) {
		this.maker_name = maker_name;
	}

	public String getMaker_email() {
		return maker_email;
	}

	public void setMaker_email(String maker_email) {
		this.maker_email = maker_email;
	}

	public String getMaker_phone() {
		return maker_phone;
	}

	public void setMaker_phone(String maker_phone) {
		this.maker_phone = maker_phone;
	}

	public String getMaker_kakao_channel() {
		return maker_kakao_channel;
	}

	public void setMaker_kakao_channel(String maker_kakao_channel) {
		this.maker_kakao_channel = maker_kakao_channel;
	}

	public String getMaker_homepage() {
		return maker_homepage;
	}

	public void setMaker_homepage(String maker_homepage) {
		this.maker_homepage = maker_homepage;
	}

	public List<Review> getReview_list() {
		return review_list;
	}

	public void setReview_list(List<Review> review_list) {
		this.review_list = review_list;
	}

	public Sms getSms() {
		return sms;
	}

	public void setSms(Sms sms) {
		this.sms = sms;
	}
}
