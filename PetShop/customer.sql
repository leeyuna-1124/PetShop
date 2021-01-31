use Master;

create Table Customer(
UserID varchar(30) primary key,
Password varchar(30),
Name varchar(30),
Phone varchar(30)
)

Insert into Customer Values('admin', '1111', '관리자', '02-3333-4444');
Insert into Customer Values('guest', '1111', '방문객', '02-3333-4443');
Insert into Customer Values('yuna', '1111', '유나', '02-3333-4441');
Insert into Customer Values('happy', '1111', '해피', '02-3333-4343');
Select*from Customer;
