package kh.spring.fongdang.oauth.model.service;

import kh.spring.fongdang.oauth.model.dto.SnsInfo;

public interface SnsInfoService {
	/* 소셜 회원 가입 */
	public int insertSnsUser(SnsInfo userInfo);
	/* 소셜 회원 조회 */
	public SnsInfo selectSnsUser(String sns_email);

}
