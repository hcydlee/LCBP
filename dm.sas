*libname dwy "C:\Users\sli126\Documents\GitHub\LCBP";
libname dwy "D:\Project\DavidY\LCBP";
proc freq data=dwy.ad1;
    table sex;
    table smoke ;
    table stage;
run;


proc univariate data=dwy.ad1;
    var age;
run;

proc freq data=dwy.ad1;
    table ctcat;
    table cancer_b;

    table result;
run; 

proc freq data=dwy.ad1;
   where cancer_b=1;
        table sclc;
    table nsclc;
run;

proc logistic data=dwy.ad1;
    model cancer_a(event='1')=age sexc smokec  diasumm pro_grp scc cyfra211 cea;
run;
