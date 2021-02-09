/* 03_Model Validation */

/* Score Test Set */
proc score data=work.test score=work.out predict out=work.test_scored type=parms;
var 
avg_mpg cylinders enginesize horsepower length mpg_city mpg_highway
weight wheelbase;
run;

/* Graph predicted error */
proc sgplot data=work.test_scored;
title "Predicted vs Actual in Test Data";
scatter x=msrp y=model1;
run;
