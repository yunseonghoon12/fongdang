package kh.spring.fongdang.member.model.service;

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
	
	
}
