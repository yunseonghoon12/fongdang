package kh.spring.fongdang.member.domain;



import org.springframework.stereotype.Component;

@Component
public class Member {
	private String email;
	private String name;
	private String password;
	private String nickname;
	private String member_type;
	private String withdraw;
	private String profile;
	private String intro;
	private String enroll_date;
	private boolean remember_email;
	
	@Override
	public String toString() {
		return "Member [email=" + email + ", name=" + name + ", password=" + password + ", nickname=" + nickname
				+ ", member_type=" + member_type + ", withdraw=" + withdraw + ", profile=" + profile + ", intro="
				+ intro + ", enroll_date=" + enroll_date + ", remember_email=" + remember_email + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public String getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(String enroll_date) {
		this.enroll_date = enroll_date;
	}

	public boolean isRemember_email() {
		return remember_email;
	}

	public void setRemember_email(boolean remember_email) {
		this.remember_email = remember_email;
	}
	
}
