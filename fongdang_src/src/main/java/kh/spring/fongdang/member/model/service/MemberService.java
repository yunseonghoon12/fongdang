package kh.spring.fongdang.member.model.service;

import java.util.List;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.member.domain.Member;

public interface MemberService {
	
	/* 로그인 */
	public Member selectLogin(Member member);
	/* 회원 정보 조회 */
	public Member selectMember(String email);
	/* 회원가입 */
	public int insertMember(Member member) ;
	/* 회원 정보 수정 */
	public int updateMember(Member member);
	/* 회원 탈퇴 여부 수정 */
	public int withdrawMember(String email);
	/* 이메일 조회 */
	public Member selectFindEmail(String email);
	/* 회원이 좋아요를 누른 펀딩 상품 목록 조회*/
	public List<Funding> selectLikelist(int currentPage, int fundingLimit, String email);
	/* 좋아요 누른 상품 수 */
	public int countLikeList(String email);
	/* 서포터 정보에 보여질 주문 상품 3개 */
	public List<Funding> selectMyOrderList(String email);
	/* 주문한 상품 수 */
	public int countOrderList(String email);
	/* 서포터가 주문한 펀딩 상품 목록*/
	public List<Funding> selectMyTotalOrderList(int currentPage, int orderlistLimit, String email);
	/* 메이커 정보에 보여질 프로젝트 3개*/
	public List<Funding> selectMakerFunding(String email);	
	/* 메이거가 오픈한 프로젝트 목록 */
	public List<Funding> selectMyTotalProject(int currentPage, int projectLimit, String email);
	/* 메이커가 오픈한 프로젝트 수 */
	public int countMyProject(String email);
	/* 회원의 비밀번호 조회 */
	public Member selectFindPassword(String email);
}
