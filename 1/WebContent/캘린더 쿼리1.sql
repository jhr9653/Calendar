
-- root 로 접속

-- Calendar 사용자계정 생성
create user 'Calendar'@'localhost' identified by '1234';

-- Calendar이 사용하는 DB(Schema) 생성
create database Calendar;

-- Calendar에게 Calendar(스키마) 권한 부여
grant all privileges on Calendar.* to 'Calendar'@'localhost' with grant option;

-- Calendar에게 파일 처리권한 부여
grant file on *.* to 'Calendar'@'localhost';