/*
 * 판매원 데이터 릴레이션
 */

CREATE TABLE `customer` (
  `name` varchar(20) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `industrytype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `saleperson` (
  `name` varchar(20) NOT NULL,
  `age` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `order` (
  `number` int NOT NULL,
  `custname` varchar(45) DEFAULT NULL,
  `salesperson` varchar(45) DEFAULT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`number`),
  KEY `sales_name_idx` (`salesperson`),
  KEY `cust_name_idx` (`custname`),
  CONSTRAINT `cust_name` FOREIGN KEY (`custname`) REFERENCES `customer` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_name` FOREIGN KEY (`salesperson`) REFERENCES `salesperson` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- (1) 샘플 데이터 입력
-- 고객의 도시는 도시명만 입력, 그리고 '부산', 'LA', 주소를 하나 꼭 입력
-- 판매원 '홍길동'

insert into customer values('홍길동', '부산', '전자');
insert into customer values('고산수', '서울', '전자');
insert into customer values('지름신', '광주', '유통');

insert into salesperson values('홍길동', 30, 3000000);
insert into salesperson values('알짜왕', 35, 3100000);

insert into new_schema.order values(1, '지름신', '홍길동', 30);
insert into new_schema.order values(2, '고산수', '알짜왕', 15);
insert into new_schema.order values(3, '홍길동', '홍길동', 20);
insert into new_schema.order values(4, '지름신', '홍길동', 40);

select * from customer;
select * from salesperson;
select * from new_schema.order;



-- (2) 모든 판매원의 이름과 급여를 보이시오. 단, 중복 행은 제거한다.


-- (3) 나이가 30세 미만인 판매원의 이름을 보이시오.


-- (4) ‘산’로 끝나는 도시에 사는 고객의 이름을 보이시오.

-- (5) 주문을 한 고객의 수(서로 다른 고객만)를 보이시오.

-- (6) 판매원 각각에 대하여 주문의 수를 계산하시오.

-- (7) '광주'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(부속질의를 사용).

-- (8) ‘광주’에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(조인을 사용).

-- (9) 두 번 이상 주문을 받은 판매원의 이름을 보이시오.

-- (10) 판매원 ‘홍길동’의 봉급을 45,000원으로 변경하는 SQL 문을 작성하시오.

-- (11) cascade 테스트 --
-- 참조 http://blog.naver.com/PostView.nhn?blogId=myca11&logNo=80131120489

-- order.custname 이 on update/delete casecade 상태
-- 현재 order에 지름신은 1, 4번에 주문이 있음.
select * from new_schema.order;

-- 고객 테이블 지름신을 '오해영' 으로 변경

-- 변경후 주문 테이블 확인.

-- end cascade 테스트 --
