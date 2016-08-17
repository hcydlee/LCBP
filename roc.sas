%let path=C:\sli126\GitHub\LCBP;
data forr;
	set b1;
	where estp ne . and cancer_b1 ne .;
	
	y=-6.8272+0.0391*age+0.7917*smokec+1.3388*ch+0.1274*diasumm+1.0407*spiculation+0.7838*slobec;
	accpp=exp(y)/(1+exp(y));

run;

proc export data=forr outfile="&path\a163.csv" replace; run;

data forr1;
	set b1;
	where center in (1,5) and nmiss(age,smokec, diasumm ,spiculation , sexc, pro_grp, scc, cyfra211, cea)=0 and cancer_b ne .;
run;
/*
proc sort data=forr1 out=t1(keep=id center);
	by id;
run;
proc sort data=b179 out=t2(keep=id center);
	by id;
run;
proc compare base=t1 compare=t2;
	id id;
run;
*/
proc export data=forr1 outfile="&path\b179.csv" replace; run;

data forr2;
	set b2;
	where estp ne . and cancer_a1 ne .;
run;

proc export data=forr2 outfile="&path\c389.csv" replace; run;

data forr3;
	set b2;
	where center in (1,5) and nmiss(age, smokec , ch ,sexc,   pro_grp, scc ,cyfra211, cea)=0 and cancer_a ne .;
run;

proc export data=forr3 outfile="&path\d326.csv" replace; run;
