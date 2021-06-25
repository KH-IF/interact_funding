--=============================
-- IF 관리자(system) 계정
--=============================
--create user if 
--identified by if
--default tablespace users;
--
--grant connect, resource to if;
--
--show user;
--
--SELECT * FROM ALL_USERS;
----SELECT 테이블명 FROM USER_TABLES;

--select * from ALL_CONS_COLUMNS;

commit;
--=============================
-- IF 계정
--=============================
drop table coupon_record;
drop table coupon;
drop table admin_board;
drop table funding_participation;
drop table like_record;
drop table funding_comment;
drop table attachment;
drop table funding_board;
drop table funding_reward;
drop table funding;
drop table rate_plan;
drop table category;
drop table pwd_certification;
drop table message;
drop table point;
drop table member;

drop sequence coupon_record_no;
drop sequence seq_coupon_no;
drop sequence seq_admin_board_no;
drop sequence seq_funding_participation_no;
drop sequence seq_like_record_no;
drop sequence seq_funding_comment_no;
drop sequence seq_attachment_no;
drop sequence seq_funding_board_no;
drop sequence seq_funding_reward_no;
drop sequence seq_funding_no;
drop sequence seq_pwd_certification_no;
drop sequence seq_message_no;
drop sequence seq_point_no;
drop sequence seq_member_no;


drop trigger trig_like_update;
drop trigger trig_like;
drop trigger trig_funding_participation;
drop trigger trig_point;


--회원테이블
create table member(
    member_no number,
    email varchar2(100) not null,
    password varchar2(100) not null,
    name varchar2(100),
    platform varchar2(100) default 'IF',
    access_token varchar2(300),
    point number default 0,
    reg_date date default sysdate,
    phone char(11),
    constraint pk_member_no primary key(member_no)
);
commit;
rollback;

--회원테이블 seq
create sequence seq_member_no;


--포인트테이블
create table point(
    no number,
    reg_date date default sysdate,
    point varchar2(100),
    member_no number,
    memo varchar2(200),
    constraint pk_point_no primary key(no),
    constraint fk_point_member_no foreign key(member_no) references member(member_no) on delete set null
);

--포인트테이블 seq
create sequence seq_point_no;

--포인트 트리거
create or replace trigger trig_point
    before
    insert on point
    for each row
begin
    update member
    set point = :new.point + point
    where member_no = :new.member_no;
end;
/


--메세지 테이블
create table message(
    no number,
    to_member_no number,
    from_member_no number,
    from_member_name varchar2(100),
    title varchar2(200),
    content varchar2(2000),
    read char(1) default 'N',
    to_member_name varchar2(100),
    constraint pk_message_no primary key(no),
    constraint fk_to_member_no foreign key(to_member_no) references member(member_no) on delete set null,
    constraint fk_from_member_no foreign key(from_member_no) references member(member_no) on delete set null,
    constraint ck_read check(read in ('Y','N'))
);
--메세지 테이블 seq
create sequence seq_message_no;



--비밀번호인증 테이블
create table pwd_certification(
    no number,
    member_no number,
    certification_code varchar2(100),
    constraint pk_pwd_certification_no primary key(no),
    constraint fk_pwd_certification_member_no foreign key(member_no) references member(member_no) on delete set null
);


--비밀번호인증 테이블 seq
create sequence seq_pwd_certification_no;



--카테고리 테이블
create table category(
    category_code varchar2(10),
    category_name varchar2(100),
    constraint pk_category_code primary key(category_code)
);


--카테고리 테이블 값추가
insert into category values('C1', '테크·가전');
insert into category values('C2', '푸드');
insert into category values('C3', '여행');
insert into category values('C4', '스포츠');
insert into category values('C5', '게임·취미');
insert into category values('C6', '모임');
insert into category values('C7', '반려동물');
insert into category values('C8', '기부·후원');


--요금제 테이블
create table rate_plan(
    rate_plan_code varchar2(10),
    rate_plan_name varchar2(100),
    rate_plan_commission number,
    constraint pk_rate_plan_code primary key(rate_plan_code)
);

--요금제 테이블 값추가
insert into rate_plan values('P1', 'Light',9);
insert into rate_plan values('P2', 'Basic',12);
insert into rate_plan values('P3', 'Pro',14);
insert into rate_plan values('P4', 'Expert',20);



--펀딩 테이블
create table funding(
    funding_no number,
    title varchar2(500),
    category_code varchar2(10),
    now_amount number,--현재금액
    goal_amount number,--목표금액
    rate_plan_code varchar2(10),--요금제,
    writer_no number,
    readCount number default 0,
    like_count number default 0,
    content clob,
    early_content clob,--얼리버드용
    start_date date,
    d_day date,
    reg_date date default sysdate,
    phone char(11),
    status char(1),
    constraint pk_funding_no primary key(funding_no),
    constraint ck_funding_status check(status in ('Y','N')),
    constraint fk_funding_category_code foreign key(category_code) references category(category_code) on delete set null,
    constraint fk_funding_writer_no foreign key(writer_no) references member(member_no) on delete set null,
    constraint fk_funding_rate_plan_code foreign key(rate_plan_code) references rate_plan(rate_plan_code) on delete set null
);
--펀딩 테이블 seq
create sequence seq_funding_no;



--펀딩 리워드 테이블
create table funding_reward(
    reward_no number,
    funding_no number,
    price number,
    title varchar2(100),
    content varchar2(2000),
    shipping_price number,--배송비
    limit_amount number,--제한수량
    shipping_date date,--배송일(배송에걸리는 일수)
    constraint pk_funding_reward_no primary key(reward_no),
    constraint fk_funding_reward_funding_no foreign key(funding_no) references funding(funding_no) on delete set null
);

--펀딩 리워드 테이블 seq
create sequence seq_funding_reward_no;

insert into funding_reward(reward_no, funding_no, title) values(seq_funding_reward_no.nextval, NULL, '추가후원');

--펀딩 새소식 게시판
create table funding_board(
    no number,
    funding_no number,
    title varchar2(100),
    writer_no number,
    content clob,
    reg_date date default sysdate,
    read_count number,
    constraint pk_funding_board_no primary key(no),
    constraint fk_funding_board_funding_no foreign key(funding_no) references funding(funding_no) on delete set null,
    constraint fk_fudding_board_writer_no foreign key(writer_no) references member(member_no) on delete set null
);

--펀딩 새소식 게시판
create sequence seq_funding_board_no;

--펀딩 대표이미지 첨부파일
create table attachment(
    no number,
    funding_no number,
    originalFilename varchar2(200),
    renamedFilename varchar2(200),
    status char(1),
    constraint pk_attachment_no primary key(no),
    constraint ck_attachment_status check(status in ('Y','N')),
    constraint fk_attachment_funding_no foreign key(funding_no) references funding(funding_no) on delete set null
);
--첨부파일 번호 시퀀스
create sequence seq_attachment_no;

--커뮤니티(댓글) 테이블
create table funding_comment(
    comment_no number,
    comment_level number default 1,
    writer_no number,
    content varchar2(2000),
    funding_no number,
    comment_ref number,
    reg_date date default sysdate,
    constraint pk_funding_comment_no primary key(comment_no),
    constraint fk_funding_comment_writer_no foreign key(writer_no) references member(member_no) on delete set null,
    constraint fk_funding_comment_funding_no foreign key(funding_no) references funding(funding_no) on delete set null,
    constraint fk_funding_comment_comment_ref foreign key(comment_ref) references funding_comment(comment_no) on delete set null
);

--커뮤니티(댓글) 테이블 시퀀스
create sequence seq_funding_comment_no;

--funding좋아요 관리 테이블
create table like_record(
    no number,
    funding_no number,
    member_no number,
    status char(1),
    constraint pk_like_no primary key(no),
    constraint fk_like_funding_no foreign key(funding_no) references funding(funding_no) on delete set null,
    constraint fk_like_member_no foreign key(member_no) references member(member_no) on delete set null,
    constraint ck_like_status check(status in ('Y','N'))
);

--funding 좋아요 관리 테이블 시퀀스
create sequence seq_like_record_no;

create or replace trigger trig_like
    after
    insert on like_record
    for each row
begin
    update funding
    set like_count = like_count+1
    where funding_no = :new.funding_no;
end;
/


--funding 좋아요 업데이트 관리 테이블 시퀀스
create or replace trigger trig_like_update
    after
    update on like_record
    for each row
begin
    --N으로 바뀔때
    if:new.status = 'N' then
        update funding
        set like_count = like_count-1
        where funding_no = :new.funding_no;
     --Y로 바뀔때
    else
        update funding
        set like_count = like_count+1
        where funding_no = :new.funding_no;
        
     end if;
end;
/


--펀딩 참여 테이블
create table funding_participation(
    no number,
    funding_no number,
    member_no number,
    reg_date date default sysdate,
    status char(1),
    reward_no number,
    point number,--추가
    address varchar2(200),--배송지
    name varchar2(100),
    phone char(11) not null,--참여자 연락처(택배)
    etc varchar2(1000),--기타요구사항
    constraint pk_f_participation_no primary key(no),
    constraint fk_f_participation_funding_no foreign key(funding_no) references funding(funding_no) on delete set null,
    constraint fk_f_participation_member_no foreign key(member_no) references member(member_no) on delete set null,
    constraint fk_f_participation_reward_no foreign key(reward_no) references funding_reward(reward_no) on delete set null
);

--펀딩 참여 테이블 시퀀스
create sequence seq_funding_participation_no;

--펀딩 참여 테이블 트리거(포인트 테이블 반영)
--펀딩에 얼마 참여한다 = 포인트 차감기록 = 회원포인트차감
create or replace trigger trig_funding_participation
    after
    insert on funding_participation
    for each row
begin
    insert into point --포인트 내역 테이블 5000원썻어 +5000  -5000
    values (seq_point_no.nextval, sysdate, (-1)*:new.point, :new.member_no, 'reward_no = '||:new.reward_no);
end;
/
-- 1, -5000, 10번회원, reward no= 1번
-- point 트리거도 연달아 작동함 회원 -5000


--공지사항 게시판 테이블
create table admin_board(
    board_no number, 
    title varchar2(50), 
    writer_no number,
    content clob, 
    reg_date date default sysdate,
    read_cnt number default 0,
    constraint pk_admin_board_no primary key(board_no),
    constraint fk_admin_writer_no foreign key(writer_no) references member(member_no) on delete set null
);
--공지사항 시퀀스
create sequence seq_admin_board_no;


--쿠폰 테이블
create table coupon(
    no number primary key,
    code varchar2(300),
    point number
);

--쿠폰 시퀀스
create sequence seq_coupon_no;

--쿠폰값 추가
insert into coupon values(seq_coupon_no.nextval, 'IF20210708', 5000);

--쿠폰 사용내역 테이블
create table coupon_record(
    no number primary key,
    coupon_no number,
    member_no number,
    point number,
    constraint fk_coupon_record_coupon_no foreign key(coupon_no) references coupon(no) on delete cascade,
    constraint fk_coupon_record_member_no foreign key(member_no) references member(member_no) on delete cascade
);

--쿠폰 사용내역 시퀀스
create sequence seq_coupon_record_no;

--쿠폰 사용내역 트리거
create or replace trigger trig_coupon_record
    after
    insert on coupon_record
    for each row
begin
    insert into point
    values (seq_point_no.nextval, sysdate, :new.point, :new.member_no, :new.coupon_no || '번 쿠폰사용');
end;
/

--알람테이블



--관리자 테이블


select * from attachment;



select rownum, f.*
			from (
			        select funding.* 
		        	from funding  
		        	where start_date < sysdate and d_day > sysdate
		        		  and status ='Y'
		       		order by reg_date  desc
		        ) f
		where rownum between 1 and 6;





























































--김윤수 테스트영역
--IF20210708
select * from member; 
update member set point = 0;
commit;
desc member;
alter table member
MODIFY point number default 0;

select * from point;
select * from member;

select * from coupon_record;
select * from point;
select * from member;
delete from coupon_record;
commit;

update member
set point = 0
where not member_no=2;
commit;


insert into message
values(seq_message_no.nextval, 2, 23, '배기원', '제목제목제목title3', '내용입니다아아아3', 'Y');
commit;
desc message;
select * from message where from_member_no = 2 order by no desc;

select * from like_record;
insert into like_record values(seq_like_record_no.nextval, 99, 2, 'Y');
commit;
select * from funding;

update funding
set writer_no = 2, status = 'Y'
where funding_no=15;

commit;

select * from attachment where status='Y';

select* from funding where writer_no=2;

insert into attachment values(seq_attachment_no.nextval, 14, 'dddfsfasfasz', '20210616_221024660_219.png', 'Y');
commit;

select * from funding_participation;
update funding_participation
set member_no = 2
where no=3;

select * from point;

select * from message order by no desc;
select * from member;

--김경태 테스트영역

--김주연 테스트영역

    select 
    f.*,
    (select count(*) from attachment where funding_no= f.funding_no)attach_count
from 
    funding f
where 
    f.writer_no = 21;
order by 
    f.funding_no desc;

select F.*,
       A.no,
       A.funding_no,
       A.originalfilename,
       A.renamedfilename,
       A.status Astatus
from funding F left join attachment A
on F.funding_no = A.funding_no
where 
    writer_no = 41;



select * from category;
select * from funding; 
update
			funding
		set
			category_code = 'C1',
			title = '안녕하세요',
			goal_amount = 502000,
			reg_date = default,
			d_day = 'Tue Jun 22 00:00:00 KST 2021' 			
		where
			funding_no = '21';	

update
    funding
    set 
    status = 'Y'
    where 
        writer_no = 21;
        and funding_no= 99;
commit;

	select
			f.*, (select name 
            from member where member_no = f.writer_no)name
		from
			funding f
        
		where
			f.writer_no = 21
			and f.status = 'Y';

select  
rownum, f.*
from (
        select funding.* ,
        REPLACE(category_code, 'C1', '테크.가전'),
        REPLACE(category_code, 'C5', '게임.취미')적용결과
        from funding  
        where start_date < sysdate and d_day > sysdate
        order by reg_date  desc
        ) f
where rownum between 1 and 6;
select  
rownum,  f.*
from (
        select funding.* ,
        CASE category_code
                 WHEN 'C1' THEN '테크.가전'
                 WHEN 'C2' THEN '푸드'
                 WHEN  'C3' THEN '여행'
                 WHEN  'C4' THEN '스포츠'
                 WHEN 'C5' THEN '게임.취미'
                 WHEN 'C6' THEN '모임'
                 WHEN  'C7' THEN  '반려동물'
                 WHEN  'C8' THEN '기부.후원'
                 END
        from funding  
        where start_date < sysdate and d_day > sysdate
        order by reg_date  desc
        ) f
where rownum between 1 and 6;


--박요한 테스트영역

--배기원 테스트영역
select  
rownum, f.*
from (
        select funding.* ,
         CASE category_code
         WHEN 'C1' THEN '테크.가전'
         WHEN 'C2' THEN '푸드'
         WHEN  'C3' THEN '여행'
         WHEN  'C4' THEN '스포츠'
         WHEN 'C5' THEN '게임.취미'
         WHEN 'C6' THEN '모임'
         WHEN  'C7' THEN  '반려동물'
         WHEN  'C8' THEN '기부.후원'
         END
        from funding  
        where start_date < sysdate and d_day > sysdate
        order by reg_date  desc
        ) f
where rownum between 1 and 6;

select rownum, f.*
from (
        select *
        from funding  
        where start_date <  d_day 
        order by reg_date  desc
        ) f
where rownum between 1 and 5;

select*from funding;
select*from category;
SELECT  category_code, 
       CASE category_code
         WHEN 'C1' THEN '테크.가전'
         WHEN 'C2' THEN '푸드'
         WHEN  'C3' THEN '여행'
         WHEN  'C4' THEN '스포츠'
         WHEN 'C5' THEN '게임.취미'
         WHEN 'C6' THEN '모임'
         WHEN  'C7' THEN  '반려동물'
         WHEN  'C8' THEN '기부.후원'
         END
  FROM funding;
  
  select*from category;
   
  select*from funding_reward;
  
  select *  from funding;
  
select
    *
from 
    funding 
    where 
        start_date > sysdate ;
        
    select*from funding;
    
       update funding  set    goal_amount = 350000  
    where funding_no  =18;
    
  select*from funding where start_date ='2021/06/30';
  
insert into funding
values (25, '펀딩', 'C1', 30000, 500000,'P1' ,21, 0,0,'[향수]냄새는 좋고 너무 행복합니다. ', null, '2021/06/30', '2021/06/11', '2021/06/12', '01012341234');  
insert into funding
values (26, '펀딩', 'C1', 30000, 500000,'P1' ,21, 0,0,'[피부]  피부가맑아지는나를 보십쇼 ', null, '2021/06/30', '2021/06/11', '2021/06/12', '01012341234');  
insert into funding
values (27, '펀딩', 'C1', 30000, 500000,'P1' ,21, 0,0,'[피부]  피부가맑아지는나를 보십쇼 ', '[피부]  피부가맑아지는나를 보십쇼', '2021/06/30', '2021/06/11', '2021/06/12', '01012341234');

insert into funding
values (28, '펀딩', 'C1', 30000, 500000,'P1' ,21, 0,0,'[피부]  피부가맑아지는나를 보십쇼 ', ' [피부]  피부가맑아지는나를 보십쇼', '2021/06/30', '2021/06/11', '2021/06/12', '01012341234');

  commit;



--이승우 테스트영역

select * from funding order by funding_no desc;
select count(*) from funding;

select nvl(writer_no, 0) '탈퇴회원' from funding;

select
			f.*
		from
			(select
			f.*,
			c.category_name categoryName,
			m.name Name
			from
			funding f
				left join category c
					on f.category_code = c.category_code
				left join member m
                	on f.writer_no = m.member_no
			order by f.reg_date desc
		) f
where start_date < sysdate;

select 
count(*) 
from 
funding f;

select
			count(*)
		from
			(select
			f.*,
			c.category_name categoryName,
			m.name Name
			from
			funding f
				left join category c
					on f.category_code = c.category_code
				left join member m
                	on f.writer_no = m.member_no
			order by f.reg_date desc
		) f
where content like '%코%'
and start_date < sysdate;

select
    *
from
    attachment;

select
    f.*,
    a.renamedfilename
from
    funding f
left join attachment a
    on f.funding_no = a.funding_no;

select
			f.*
		from
			
 (select
			f.*,
			c.category_name categoryName,
			m.name Name,
			a.renamedfilename
			from
			funding f
				left join category c
					on f.category_code = c.category_code
				left join member m
                	on f.writer_no = m.member_no
                left join attachment a
                	on f.funding_no = a.funding_no
			order by f.funding_no desc
		) f
where start_date < sysdate;

select * from funding where status = 'Y';

select
* 
from 
member 
where member_no = 0;
--천호현 테스트영역
select * from funding;
select * from funding_reward;
        select
			*
		from
			funding
		where
			funding_no =9;
            
select * from member;

insert into funding_reward
values(2, 99, 2000, '옵션1', '옵션1의 content부분', 2000, 10, '2021/07/01');

insert into funding_reward
values(3, 99, 2000, '옵션2', '옵션2의 content부분', 8000, 99, '2021/07/03');

insert into funding_reward
values(5, 99, 6000, '옵션3', '옵션3의 content부분', 6000, 60, '2021/07/03');



    
insert into funding
values (99, '테스트', 'C1', 20000, 100000,'P1' ,21, 0,0,'내용이 엄청길ㅇ', null, '2021/06/10', '2021/06/30', default, '01091342261');

insert into attachment
values (1,99,'테스트오리지날1','테스트리네임','Y');

insert into like_record
values (3,99,21,'N');

insert into funding_participation
values (3,99,21, '2021/06/10', 'Y', 2, 3000, '안양', '김윤수', '0102222261','빨리주세요');

select * from funding_reward;

select * from funding_participation;

select *
from funding F 
    join funding_reward R 
    on F.funding_no = R.funding_no
    join attachment A
    on f.funding_no = A.funding_no
    join like_record L
    on L.funding_no = F.funding_no
where f.funding_no =99;

select *
from funding F 
    join funding_reward R 
    on F.funding_no = R.funding_no
    join attachment A
    on F.funding_no = A.funding_no
    join member M
    on F.writer_no = M.member_no
where f.funding_no =99;



--alter table funding
--modify readcount number default 0;

select * from funding;
ALTER TABLE funding ADD status char(1);

ALTER TABLE funding ADD CONSTRAINT ck_funding_status  CHECK (status in ('Y','N'));

desc  funding;
desc message;

select count(*)
from funding_participation;

select *
from funding;

update like_record
	    <set>
	        <if test="status == 'Y'">status='N',</if>
	        <if test="status == 'N'">status='Y',</if>
    	</set>
    	where member_no = #{member_no}

select  *
from member M
        join like_record L
        on M.member_no = L.member_no
where M.member_no = 21;


update

select F.FUNDING_NO,
        F.TITLE,
        F.CATEGORY_CODE,
                            (select count(*)
                            from funding_participation
                            where F.funding_no = 99) cioo
    from funding F 
    join funding_reward R 
    on F.funding_no = R.funding_no
    join attachment A
    on F.funding_no = A.funding_no
    join member M
    on F.writer_no = M.member_no
where f.funding_no =99;


select count(*) count
from funding_participation
where funding_no = 99;

    	
update like_record
set status = 'Y'
where member_no = 21;

select *
from funding F 
    join funding_reward R 
    on F.funding_no = R.funding_no
    join attachment A
    on F.funding_no = A.funding_no
    join member M
    on F.writer_no = M.member_no
where F.funding_no = 99;

select count(*)
    	from like_record
    	where member_no = 21 and funding_no = 99;
        
delete like_record;

select count(*)
from like_record
where funding_no = 99;


select * 
from like_record;

select *
from funding
where funding_no = 99;

UPDATE funding  
SET like_count = 0 
WHERE funding_no = 99;

select *
from member;


select count(*)
from like_record
where member_no = 21 and status = 'Y';

select count(*)
from like_record
where funding_no = 99 and status = 'Y';

select *
from funding F
    join funding_board R
    on F.funding_no = R.funding_no
where F.funding_no = 99;

insert into funding_board values(1,99, '박요한테스트', 21, '내용입니다', default, 0 );
insert into funding_board values(2,99, '천호현테스트', 21, '내용22', default, 0 );

select * from funding_board;


		select
			*
		from
			funding_reward
		where
			funding_no = 99;


-----------------------
select * from tab;

select * 
from funding
where
    start_date < sysdate
    and d_day > sysdate;



commit;