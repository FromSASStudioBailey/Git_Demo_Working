/* 02 - Model Build */

/* split data into test / train */
data work.final; set work.final;
rand = ranuni(1234);
grp = 0;
if rand > .8 then grp = 1;
run;

proc sql; create table work.train as 
select * from work.final
where grp = 0
; quit;

proc sql; create table work.test as
select * from work.final
where grp = 1
; quit;

/* train model */
proc reg outest=out noprint;
model msrp = enginesize cylinders horsepower mpg_city mpg_highway avg_mpg
weight wheelbase length;
run;
