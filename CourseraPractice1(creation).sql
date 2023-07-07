create table User1(
 user_id INT ,
 username VARCHAR(100),
 email VARCHAR(100),
 passcode VARCHAR(100),
 primary key(user_id)
);

create table product(
 product_id INT,
 productname VARCHAR(100),
 price decimal,
 seller_id int,
 primary key(product_id)
);

create table category(
 categoryid INT,
 categoryname varchar(20),
 primary key(categoryid)
);

create table productcategory(
 product_id INT,
 categoryid int,
 PRIMARY KEY(product_id,categoryid),
 FOREIGN KEY(categoryid) REFERENCES category(categoryid) ON DELETE cascade,
 FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE cascade
);

create table orders(
 order_id INT,
 user_id INT,
 order_date DATE,
 total decimal,
 primary key(order_id),
 foreign key(user_id)references User1 (user_id) on delete set null
);

ALTER TABLE orders ADD (
  product_id INT,
 foreign key(product_id)references product (product_id) on delete set null);
 
 ALTER TABLE orders ADD (
  categoryid INT,
 foreign key(categoryid)references category (categoryid) on delete set null);


create table order_items(
	order_id INT,
    product_id INT,
    quantity int,
    primary key(order_id,product_id),
    foreign key(order_id) references orders(order_id) on delete cascade,
    foreign key(product_id) references product(product_id) on delete cascade
);


insert into User1 values(0000,"marky","marky@gamil.com","daaamn");
insert into User1 values(0001,"malyy","malyy@gamil.com","suchil");
insert into User1 values(0002,"jony","jonyy@gamil.com","jokdsds");
insert into User1 values(0003,"bary","baryy@gamil.com","fdews");

insert into product values(2342,"stove",23000,3212);
insert into product values(2652,"fridge",230000,3432);
insert into product values(2322,"machine",27000,3542);
insert into product values(2345,"mop",4000,3546);

insert into category values(1,"clean");
insert into category values(2,"food");

insert into productcategory values(2342,2);
insert into productcategory values(2652,2);
insert into productcategory values(2322,1);
insert into productcategory values(2345,1);

insert into orders values(01,0001,"23-10-11",46000);
insert into orders values(02,0000,"23-10-9",230000);
insert into orders values(03,0002,"23-1-17",27000);
insert into orders values(04,0003,"2023-12-2",12000);

insert into order_items values(01,2342,2);
insert into order_items values(02,2652,1);
insert into order_items values(03,2322,1);
insert into order_items values(04,2345,3);


