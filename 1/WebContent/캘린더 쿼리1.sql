
-- root 로 접속

-- jspbook 사용자계정 생성
create user 'Calendar'@'localhost' identified by '1234';

-- jspbook이 사용하는 DB(Schema) 생성
create database Calendar;

-- jspbook에게 jspdb 권한 부여
grant all privileges on Calendar.* to 'Calendar'@'localhost' with grant option;

-- jspbook에게 파일 처리권한 부여
grant file on *.* to 'Calendar'@'localhost';