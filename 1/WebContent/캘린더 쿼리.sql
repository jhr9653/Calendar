CREATE TABLE CALENDARMEMO (
CALENDARMEMO_CONTENTS VARCHAR(500),
CALENDARMEMO_YEAR INT,
CALENDARMEMO_MONTH INT,
CALENDARMEMO_DAY INT
/* CALENDARMEMO_NUM INT,
CALENDARMEMO_ID VARCHAR(30),
CALENDARMEMO_PASSWD VARCHAR(30)   --> 지금 당장은 필요없으니 추후에 회원가입 폼 사용시 추가할것 */
);

INSERT INTO CALENDARMEMO(CALENDARMEMO_CONTENTS, CALENDARMEMO_YEAR, CALENDARMEMO_MONTH, CALENDARMEMO_DAY)
VALUES ('test', 2011, 6, 1), ('test2', 2016, 5, 10);

select * from calendarmemo;