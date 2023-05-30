create table useraccount (
   userid varchar(10) primary key,
   password varchar(15),
   username varchar(20),
   phoneno varchar(20),
   postcode varchar(7),
   address varchar(30),
   email varchar(50),
   birthday datetime
);

drop table sale;
CREATE TABLE sale (  --주문정보
	saleid int PRIMARY KEY,  
	userid varchar(10) NOT NULL, 
	saledate datetime,
	foreign key (userid) references useraccount (userid)
);
select * from sale
drop table saleitem;
CREATE TABLE saleitem (   --주문상품
	saleid int ,
	seq int ,
	itemid int NOT NULL,
	quantity int,
	PRIMARY KEY (saleid, seq),
	foreign key (saleid) references sale (saleid),
	foreign key (itemid) references item (id)
);
select * from saleitem