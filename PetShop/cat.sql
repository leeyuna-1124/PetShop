use Master;

create table Cat(
pID varchar(10) primary key,
pName varchar(20) not null,
category varchar(20),
price int
)

insert Cat values('001','고등어','먹이',150000)
insert Cat values('002','멋있는 캣타워','놀이',36000)
insert Cat values('008','짤랑짤랑 방울','놀이',5000)
insert Cat values('009','고양이 모래','생활',20000)
insert Cat values('010','고양이 샴푸','생활',21000)
insert Cat values('080','파란색 옷','의류',11000)


select * from Cat;