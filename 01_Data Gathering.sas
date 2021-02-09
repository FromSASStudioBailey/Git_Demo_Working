/* 01 - Data Gathering */

/* ingest source data */
data work.initial; set sashelp.cars; run; 

/* create avg MPG variable */
data work.adjusted; set work.initial;
avg_mpg = sum(mpg_city + mpg_highway)/2;
run;

/* subset data into front wheel drive vehicles only */
proc sql; create table work.final as
select * from work.adjusted
where DriveTrain = "Front"
; quit;
