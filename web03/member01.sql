select * from member
drop table product
create table product(pronum varchar2(8) primary key,proname varchar2(40) not null,proprice number(8) not null,procnt number(4) not null, proimg varchar2(100))
insert into product values('A1001','노페히말','900000','10',NULL)
insert into product values('A1002','몽클레어','2300000','7',NULL)
insert into product values('B1003','캐나다구스','1500000','13',NULL)
insert into product values('B1004','블랙야크','500000','10',NULL)
insert into product values('D1101','삐루루루','1305000','12','./img/딥티크오데썽.jpg')
create sequence notice_num start with 6 increment by 1 maxvalue 10000 cycle nocache
insert into notice (idx, n_id, title, content, con_date) values (notice_num.NEXTVAL, 'k', '제목 테스트', '내용 테스트', '2021-11-21')
select * from notice
update notice set n_id='A007' where n_id='k'

select substr(n_id, 2, 3) as num2 from notice where idx in (select max(idx) from notice)
create table notice2 as select * from notice;
alter table noitce2 add column par_idx number(6)
select * from heavy
select * from product
create table heavy (h_name varchar2(80) primary key, h_img varchar2(100), h_base varchar2(30) not null);
insert into heavy values ('딥디크 탐다오','./img/딥티크탐다오.jpg','우드');
insert into heavy values ('아이젠버그 러브 어페어','./img/아이젠버그러브어페어.jpg','머스크');

create table light (l_name varchar2(80) primary key, l_img varchar2(100), l_base varchar2(30) not null);
insert into light values ('세르주루텐 로','./img/세르주루텐로.jpg','시트러스');
insert into light values ('메종 마르지엘라 플라워마켓','./img/메종마르지엘라플라워마켓.jpg','플로럴');

create table unisex (u_name varchar2(80) primary key, u_img varchar2(100), u_base varchar2(30) not null);
insert into unisex values ('딥디크 오데썽','./img/딥티크오데썽.jpg','시트러스');
insert into unisex values ('나르시소 로드리게즈 퓨어머스크','./img/나르시소로드리게즈퓨어머스크.jpg','머스크');

create table man (m_name varchar2(80) primary key, m_img varchar2(100), m_base varchar2(30) not null);
insert into man values ('아쿠아 디 파르마 미르토 디 파나레아','./img/아쿠아디파르마미르토디파나레아.jpg','시트러스');
insert into man values ('바이레도 집시워터','./img/바이레도집시워터.jpg','우드');
insert into man values ('메종 마르지엘라 커피 브레이크','./img/메종마르지엘라커피브레이크.jgp','오리엔탈');

create table woman (w_name varchar2(80) primary key, w_img varchar2(100), w_base varchar2(30) not null);
insert into woman values ('아쿠아 디 파르마 유자 오드퍼퓸','./img/아쿠아디파르마유자오드퍼퓸.jpg','시트러스');
insert into woman values ('펜할리곤스 루나','./img/펜할리곤스루나.jpg','머스크');
insert into woman values ('딥디크 롬브로단로','./img/딥티크롬브로단로.jpg','플로럴');
update product set proimg='/img/딥티크오데썽.jpg' where proname='삐루루루'
update notice set n_id='A002' where idx=2;
update notice set n_id='A003' where idx=3;
update notice set n_id='A004' where idx=4;
update notice set n_id='A005' where idx=5;
update notice set n_id='A006' where idx=6;
select * from product;
select substr(pronum,2,3) as num2 from (select * from product order by pronum desc) where rownum <=3;