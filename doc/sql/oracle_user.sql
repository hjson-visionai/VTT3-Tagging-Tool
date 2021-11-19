
DROP TAbLE DEMO_USER_TB;
DROP TAbLE DEMO_RELUSERROLE_TB;
DROP TAbLE DEMO_ROLE_TB;
DROP TAbLE DEMO_CURRUSER_TB;


/* DEMO_USER_TB */
CREATE TABLE
    DEMO_USER_TB
    (
        USERID NUMBER(10) NOT NULL,
        USERNAME VARCHAR2(50),
        REALNAME VARCHAR2(150),
        PASSWORD VARCHAR2(150),
        CREATETIME TIMESTAMP(6) WITH TIME ZONE,
        MODIFYTIME TIMESTAMP(6) WITH TIME ZONE,
        DELFLAG NUMBER(1),
        CONSTRAINT PK_DEMO_USER_TB PRIMARY KEY (USERID)
    );
COMMENT ON TABLE demo_user_tb IS '사용자 설정';
COMMENT ON COLUMN demo_user_tb.userid IS '사용자 ID';
COMMENT ON COLUMN demo_user_tb.username IS '사용자 접속 ID';
COMMENT ON COLUMN demo_user_tb.realname IS '사용자 명';
COMMENT ON COLUMN demo_user_tb.password IS '비밀번호';
COMMENT ON COLUMN demo_user_tb.createtime IS '생성시각';
COMMENT ON COLUMN demo_user_tb.modifytime IS '수정시각';
COMMENT ON COLUMN demo_user_tb.delflag IS '삭제 여부';

INSERT INTO DEMO_USER_TB (USERID,USERNAME,REALNAME,PASSWORD,CREATETIME,MODIFYTIME,DELFLAG) values (1,'admin','관리자','c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec',SYSDATE, SYSDATE, 0 );
INSERT INTO DEMO_USER_TB (USERID,USERNAME,REALNAME,PASSWORD,CREATETIME,MODIFYTIME,DELFLAG) values (2,'system','시스템','c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec',SYSDATE, SYSDATE, 0 );


/* DEMO_RELUSERROLE_TB */
CREATE TABLE
    DEMO_RELUSERROLE_TB
    (
        USERID NUMBER(10) NOT NULL,
        ROLEID NUMBER(10) NOT NULL,
        ISHEADROLE NUMBER(1),
        CONSTRAINT PK_DEMO_RELUSERROLE_TB PRIMARY KEY (USERID, ROLEID)
    );
COMMENT ON TABLE DEMO_RELUSERROLE_TB IS '사용자/역할 관계 테이블';
COMMENT ON COLUMN DEMO_RELUSERROLE_TB.USERID IS '사용자 ID';
COMMENT ON COLUMN DEMO_RELUSERROLE_TB.ROLEID IS '역할 ID';
COMMENT ON COLUMN DEMO_RELUSERROLE_TB.ISHEADROLE IS '대표 역할 여부';

/* DEMO_ROLE_TB */
CREATE TABLE
    DEMO_ROLE_TB
    (
        ROLEID NUMBER(10) NOT NULL,
        ROLENAME VARCHAR2(50),
        CAPTION VARCHAR2(150),
        CREATETIME TIMESTAMP(6) WITH TIME ZONE,
        MODIFYTIME TIMESTAMP(6) WITH TIME ZONE,
        DELFLAG NUMBER(1),
        CONSTRAINT PK_DEMO_ROLE_TB PRIMARY KEY (ROLEID)
    );
COMMENT ON TABLE DEMO_ROLE_TB IS '역할 설정';
COMMENT ON COLUMN DEMO_ROLE_TB.ROLEID IS '역할 ID';
COMMENT ON COLUMN DEMO_ROLE_TB.ROLENAME IS '역할 명';
COMMENT ON COLUMN DEMO_ROLE_TB.CAPTION IS '역할 설명';
COMMENT ON COLUMN DEMO_ROLE_TB.CREATETIME IS '생성시각';
COMMENT ON COLUMN DEMO_ROLE_TB.MODIFYTIME IS '수정시각';
COMMENT ON COLUMN DEMO_ROLE_TB.DELFLAG IS '삭제 여부';

/* DEMO_CURRUSER_TB */
CREATE TABLE
    DEMO_CURRUSER_TB
    (
        CURRENTID NUMBER(10) NOT NULL,
        USERID NUMBER(10) NOT NULL,
        LOGINTIME TIMESTAMP(6) WITH TIME ZONE,
        USERIP VARCHAR2(15),
        CONSTRAINT PK_DEMO_CURRUSER_TB PRIMARY KEY (CURRENTID, USERID)
    );
COMMENT ON TABLE DEMO_CURRUSER_TB IS '접속 사용자';
COMMENT ON COLUMN DEMO_CURRUSER_TB.CURRENTID IS '세션 ID';
COMMENT ON COLUMN DEMO_CURRUSER_TB.USERID IS '사용자 ID';
COMMENT ON COLUMN DEMO_CURRUSER_TB.LOGINTIME IS '로그인 시각';
COMMENT ON COLUMN DEMO_CURRUSER_TB.USERIP IS '사용자 IP';


