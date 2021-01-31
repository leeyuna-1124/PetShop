use Master;

create table Dog(
pID varchar(10) primary key,
pName varchar(20) not null,
category varchar(20),
price int
)

insert Dog values('001','단백질 사료','먹이',150000)
insert Dog values('002','레인보우 공','놀이',12000)
insert Dog values('008','소다맛 개껌','먹이',8000)
insert Dog values('009','일회용 배변패드','생활',20000)
insert Dog values('010','꽃무늬 목줄','생활',35000)
insert Dog values('080','패딩조끼','의류',35000)


select * from Dog;