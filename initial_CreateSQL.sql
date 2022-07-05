DROP TABLE "NOTICE" CASCADE CONSTRAINTS;
DROP TABLE "ANSWER" CASCADE CONSTRAINTS;
DROP TABLE "ASK" CASCADE CONSTRAINTS;
DROP TABLE "ALARM" CASCADE CONSTRAINTS;
DROP TABLE "MESSAGE" CASCADE CONSTRAINTS;
DROP TABLE "PICK" CASCADE CONSTRAINTS;
DROP TABLE "REPORT" CASCADE CONSTRAINTS;
DROP TABLE "REVIEW" CASCADE CONSTRAINTS;
DROP TABLE "PAY" CASCADE CONSTRAINTS;
DROP TABLE "ORDER" CASCADE CONSTRAINTS;
DROP TABLE "OPTION" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCT" CASCADE CONSTRAINTS;
DROP TABLE "CATEGORY" CASCADE CONSTRAINTS;
DROP TABLE "MAKER" CASCADE CONSTRAINTS;
DROP TABLE "MEMBER" CASCADE CONSTRAINTS;

CREATE TABLE "MEMBER" (
	email	VARCHAR2(100)		NOT NULL,
	name	VARCHAR2(50)		NOT NULL,
	password	VARCHAR2(50)		NOT NULL,
	nickname	VARCHAR2(50)		NOT NULL,
	member_type	CHAR(1)	DEFAULT 'I'	NOT NULL,
	withdraw	CHAR(1)	DEFAULT 'N'	NOT NULL,
    	original_profile VARCHAR2(4000)     NULL,
	rename_profile	VARCHAR2(4000)		NULL,
	intro	VARCHAR2(300)		NULL,
	enroll_date	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);
COMMENT ON COLUMN "MEMBER".member_type IS '개인: I, 관리자: A';

COMMENT ON COLUMN "MEMBER".withdraw IS '탈퇴 시 Y, 아니면  N';

CREATE TABLE "MAKER" (
	maker_name	VARCHAR2(100)		NOT NULL,
	email	VARCHAR2(100)		NOT NULL,
	maker_category	CHAR(1)		NOT NULL,
	maker_phone	VARCHAR2(20)		NOT NULL,
	maker_email	VARCHAR2(100)		NOT NULL,
	maker_logo	VARCHAR2(200)		NULL,
	maker_kakao_channel	VARCHAR2(200)		NULL,
	maker_homepage	VARCHAR2(200)		NULL,
	maker_address	VARCHAR2(500)		NULL,
	maker_register_num	VARCHAR2(15)		NULL,
	maker_license_copy	VARCHAR2(200)		NULL,
	maker_report_cnt	NUMBER	DEFAULT 0	NULL
);
COMMENT ON COLUMN "MAKER".maker_category IS '개인: I, 법인: B';

COMMENT ON COLUMN "MAKER".maker_email IS '문의 이메일';

COMMENT ON COLUMN "MAKER".maker_register_num IS '주민번호 또는 사업자등록번호';

COMMENT ON COLUMN "MAKER".maker_license_copy IS '주민번호 또는 사업자등록번호';

COMMENT ON COLUMN "MAKER".maker_report_cnt IS '신고누적횟수';

CREATE TABLE "CATEGORY" (
	category_id	CHAR(2)		NOT NULL,
	category_name	VARCHAR2(15)		NOT NULL
);

COMMENT ON COLUMN "CATEGORY".category_id IS 'C1, C2, ...';

COMMENT ON COLUMN "CATEGORY".category_name IS '반려동물, 캠핑, 식품, 테크 ?가전, 뷰티, 기타';

CREATE TABLE "PRODUCT" (
	p_no	NUMBER		NOT NULL,
	maker_name	VARCHAR2(200)		NOT NULL,
	category_id	CHAR(2)		NOT NULL,
	p_name	VARCHAR2(200)		NOT NULL,
	p_goal	NUMBER		NOT NULL,
	p_thumbnail	VARCHAR2(200)		NOT NULL,
	p_summary	VARCHAR2(300)		NOT NULL,
	p_story	CLOB		NOT NULL,
	p_certification	VARCHAR2(200)		NULL,
	start_day	TIMESTAMP	NOT NULL,
	end_day	DATE	NOT NULL,
	payment_plan	DATE		NOT NULL,
	delivery_date	DATE		NOT NULL,
	p_approval	CHAR(1)	DEFAULT 'N'	NOT NULL,
	p_report_cnt	NUMBER	DEFAULT 0	NOT NULL
);
COMMENT ON COLUMN "PRODUCT".category_id IS 'C1, C2, ...';

COMMENT ON COLUMN "PRODUCT".p_goal IS '초기 목표 금액';

COMMENT ON COLUMN "PRODUCT".p_thumbnail IS '파일 저장되는 주소';

COMMENT ON COLUMN "PRODUCT".p_certification IS '파일 저장되는 주소';

COMMENT ON COLUMN "PRODUCT".delivery_date IS '발송 예정일';

COMMENT ON COLUMN "PRODUCT".p_approval IS '승인: Y, 비승인: N';

CREATE TABLE "OPTION" (
	option_no	NUMBER		NOT NULL,
	p_no	NUMBER		NOT NULL,
	option_name	VARCHAR2(600)		NOT NULL,
	option_info	VARCHAR2(1000)		NOT NULL,
	option_price	NUMBER		NOT NULL,
	option_limit	NUMBER		NOT NULL
);
COMMENT ON COLUMN "OPTION".p_no IS 'PRODUCT(p_no)';

CREATE TABLE "ORDER" (
	order_no	NUMBER		NOT NULL,
	p_no	NUMBER		NOT NULL,
	option_no	NUMBER		NOT NULL,
	email	VARCHAR2(100)		NOT NULL,
	order_name	VARCHAR2(50)		NOT NULL,
	order_phone	VARCHAR2(20)		NOT NULL,
	order_address	VARCHAR2(1000)		NOT NULL,
	total_price	NUMBER		NOT NULL,
	payment_plan	DATE		NOT NULL,
	pay_method	VARCHAR2(50)		NOT NULL
);
COMMENT ON COLUMN "ORDER".p_no IS 'PRODUCT(p_no)';

CREATE TABLE "PAY" (
	pay_no	NUMBER		NOT NULL,
	order_no	NUMBER		NOT NULL,
	p_no	NUMBER		NOT NULL,
	email	VARCHAR2(100)		NOT NULL,
	total_sum	NUMBER		NOT NULL,
	pay_method	VARCHAR2(50)		NOT NULL
);

CREATE TABLE "REVIEW" (
	r_no	NUMBER		NOT NULL,
	p_no	NUMBER		NOT NULL,
	r_writer	VARCHAR2(50)		NOT NULL,
	r_content	VARCHAR2(4000)		NULL,
	r_date	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);
COMMENT ON COLUMN "REVIEW".r_writer IS '닉네임';

CREATE TABLE "REPORT" (
	report_no	NUMBER		NOT NULL,
	email	VARCHAR2(100)		NOT NULL,
	p_no	NUMBER		NOT NULL,
	report_category	VARCHAR2(100)		NOT NULL,
	report_content	VARCHAR2(500)		NOT NULL,
	report_file	VARCHAR2(200)		NULL,
	report_date	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);

CREATE TABLE "PICK" (
	email	VARCHAR2(100)		NOT NULL,
	p_no	NUMBER		NOT NULL
);
COMMENT ON COLUMN "PICK".email IS 'MEMBER(email)';

COMMENT ON COLUMN "PICK".p_no IS 'PRODUCT(p_no)';

CREATE TABLE "MESSAGE" (
	m_no	NUMBER		NOT NULL,
	m_content	VARCHAR2(500)		NOT NULL,
	sender	VARCHAR2(50)		NOT NULL,
	receiver	VARCHAR2(50)		NOT NULL,
	m_date	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
    	response_chk CHAR(1) DEFAULT 'N' NOT NULL
);
COMMENT ON COLUMN "MESSAGE".sender IS '화면단에서  session 정보로 이메일 넣으면 됨';
COMMENT ON COLUMN "MESSAGE".response_chk IS '읽음: Y, 안 읽음: N';

CREATE TABLE "ALARM" (
	a_no	NUMBER		NOT NULL,
	email	VARCHAR2(100)		NOT NULL,
	a_content	VARCHAR2(1000)		NOT NULL,
	a_date	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	read_yn	CHAR(1)	DEFAULT 'N'	NOT NULL
);
COMMENT ON COLUMN "ALARM".read_yn IS '읽음: Y, 안 읽음: N';

CREATE TABLE "ASK" (
	ask_no	NUMBER		NOT NULL,
	email	VARCHAR2(100)		NOT NULL,
	ask_title	VARCHAR2(300)		NOT NULL,
	ask_category	VARCHAR2(50)		NOT NULL,
	ask_content	VARCHAR2(4000)		NOT NULL,
	ask_date	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	reply_yn	CHAR(1)	DEFAULT 'N'	NOT NULL
);
COMMENT ON COLUMN "ASK".reply_yn IS '답변 등록시: Y, 아니면 N';

CREATE TABLE "ANSWER" (
	ans_no	VARCHAR(255)		NOT NULL,
	ask_no	NUMBER		NOT NULL,
	ans_content	VARCHAR(255)		NULL,
	ans_date	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);
COMMENT ON COLUMN "ANSWER".ask_no IS 'ASK(ask_no)';

CREATE TABLE "NOTICE" (
	n_no	NUMBER		NOT NULL,
	n_title	VARCHAR2(50)		NOT NULL,
	n_content	VARCHAR2(4000)		NOT NULL,
	n_date	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	n_cnt	NUMBER	DEFAULT 0	NOT NULL,
	n_writer	VARCHAR2(9)	DEFAULT '관리자'	NOT NULL
);

ALTER TABLE "MEMBER" ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	email
);

ALTER TABLE "PICK" ADD CONSTRAINT PK_PICK PRIMARY KEY (
	email,
	p_no
);

ALTER TABLE "NOTICE" ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	n_no
);

ALTER TABLE "ASK" ADD CONSTRAINT PK_ASK PRIMARY KEY (
	ask_no
);

ALTER TABLE "REPORT" ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	report_no,
	email,
	p_no
);

ALTER TABLE "REVIEW" ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	r_no
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT PK_MESSAGE PRIMARY KEY (
	m_no
);

ALTER TABLE "ANSWER" ADD CONSTRAINT PK_ANSWER PRIMARY KEY (
	ans_no,
	ask_no
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	category_id
);

ALTER TABLE "ORDER" ADD CONSTRAINT PK_ORDER PRIMARY KEY (
	order_no
);

ALTER TABLE "OPTION" ADD CONSTRAINT PK_OPTION PRIMARY KEY (
	option_no,
	p_no
);

ALTER TABLE "PRODUCT" ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	p_no
);

ALTER TABLE "ALARM" ADD CONSTRAINT PK_ALARM PRIMARY KEY (
	a_no
);

ALTER TABLE "MAKER" ADD CONSTRAINT PK_MAKER PRIMARY KEY (
	maker_name
);

ALTER TABLE "PAY" ADD CONSTRAINT PK_PAY PRIMARY KEY (
	pay_no,
	order_no
);

ALTER TABLE "PICK" ADD CONSTRAINT FK_MEMBER_TO_PICK_1 FOREIGN KEY (
	email
)
REFERENCES "MEMBER" (
	email
) ON DELETE CASCADE;

ALTER TABLE "PICK" ADD CONSTRAINT FK_PRODUCT_TO_PICK_1 FOREIGN KEY (
	p_no
)
REFERENCES "PRODUCT" (
	p_no
) ON DELETE CASCADE;

ALTER TABLE "ASK" ADD CONSTRAINT FK_MEMBER_TO_ASK_1 FOREIGN KEY (
	email
)
REFERENCES "MEMBER" (
	email
) ON DELETE CASCADE;

ALTER TABLE "REPORT" ADD CONSTRAINT FK_MEMBER_TO_REPORT_1 FOREIGN KEY (
	email
)
REFERENCES "MEMBER" (
	email
) ON DELETE CASCADE;

ALTER TABLE "REPORT" ADD CONSTRAINT FK_PRODUCT_TO_REPORT_1 FOREIGN KEY (
	p_no
)
REFERENCES "PRODUCT" (
	p_no
) ON DELETE CASCADE;

ALTER TABLE "REVIEW" ADD CONSTRAINT FK_PRODUCT_TO_REVIEW_1 FOREIGN KEY (
	p_no
)
REFERENCES "PRODUCT" (
	p_no
) ON DELETE CASCADE;

ALTER TABLE "ANSWER" ADD CONSTRAINT FK_ASK_TO_ANSWER_1 FOREIGN KEY (
	ask_no
)
REFERENCES "ASK" (
	ask_no
) ON DELETE CASCADE;

ALTER TABLE "ORDER" ADD CONSTRAINT FK_OPTION_TO_ORDER_1 FOREIGN KEY (
	p_no, option_no
)
REFERENCES "OPTION" (
	p_no, option_no
) ON DELETE CASCADE;

ALTER TABLE "ORDER" ADD CONSTRAINT FK_MEMBER_TO_ORDER_1 FOREIGN KEY (
	email
)
REFERENCES "MEMBER" (
	email
) ON DELETE CASCADE;

ALTER TABLE "OPTION" ADD CONSTRAINT FK_PRODUCT_TO_OPTION_1 FOREIGN KEY (
	p_no
)
REFERENCES "PRODUCT" (
	p_no
) ON DELETE CASCADE;

ALTER TABLE "PRODUCT" ADD CONSTRAINT FK_MAKER_TO_PRODUCT_1 FOREIGN KEY (
	maker_name
)
REFERENCES "MAKER" (
	maker_name
) ON DELETE CASCADE;

ALTER TABLE "PRODUCT" ADD CONSTRAINT FK_CATEGORY_TO_PRODUCT_1 FOREIGN KEY (
	category_id
)
REFERENCES "CATEGORY" (
	category_id
) ON DELETE CASCADE;

ALTER TABLE "ALARM" ADD CONSTRAINT FK_MEMBER_TO_ALARM_1 FOREIGN KEY (
	email
)
REFERENCES "MEMBER" (
	email
) ON DELETE CASCADE;

ALTER TABLE "MAKER" ADD CONSTRAINT FK_MEMBER_TO_MAKER_1 FOREIGN KEY (
	email
)
REFERENCES "MEMBER" (
	email
) ON DELETE CASCADE;

ALTER TABLE "PAY" ADD CONSTRAINT FK_ORDER_TO_PAY_1 FOREIGN KEY (
	order_no
)
REFERENCES "ORDER" (
	order_no
) ON DELETE CASCADE;

ALTER TABLE "PAY" ADD CONSTRAINT FK_PRODUCT_TO_PAY_1 FOREIGN KEY (
	p_no
)
REFERENCES "PRODUCT" (
	p_no
) ON DELETE CASCADE;

ALTER TABLE "PAY" ADD CONSTRAINT FK_MEMBER_TO_PAY_1 FOREIGN KEY (
	email
)
REFERENCES "MEMBER" (
	email
) ON DELETE CASCADE;