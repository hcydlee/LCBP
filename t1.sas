*libname dwy "C:\Users\sli126\Documents\GitHub\LCBP";
libname dwy "C:\sli126\Documents\ydw\LCBP";
  proc sql noprint;
    select count(cancer_b) into :bign from dwy.ad1
    ;
quit;
%put bign is  &bign;
ods graphics on;

proc logistic data=dwy.ad1 plots=roc;
    model cancer_b(event='1')=age sexc smokec  diasumm pro_grp scc cyfra211 cea;
    roc 'Pro_GRP' pro_grp;
    roc 'SCC' scc;
    roc 'CYFRA211' cyfra211;
    roc 'CEA' cea;
    roccontrast reference ('CEA') /estimate e;
    
run;


ods graphics off;


ods graphics on;

proc logistic data=dwy.ad1 plots=roc;
    model nsclc(event='1')=age sexc smokec slobec diasumm pro_grp scc cyfra211 cea;
    roc 'Pro_GRP' pro_grp;
    roc 'SCC' scc;
    roc 'CYFRA211' cyfra211;
    roc 'CEA' cea;
    roccontrast reference ('CEA') /estimate e;
    
run;


ods graphics off;


ods graphics on;

proc logistic data=dwy.ad1 plots=roc;
    model sclc(event='1')=age sexc smokec slobec diasumm pro_grp scc cyfra211 cea;
    roc 'Pro_GRP' pro_grp;
    roc 'SCC' scc;
    roc 'CYFRA211' cyfra211;
    roc 'CEA' cea;
    roccontrast reference ('CEA') /estimate e;
    
run;



ods graphics off;

ods graphics on;

proc logistic data=dwy.ad1 plots=roc;
    model cancer_a(event='1')=age sexc smokec  diasumm pro_grp scc cyfra211 cea ;
    roc 'Pro_GRP' pro_grp;
    roc 'SCC' scc;
    roc 'CYFRA211' cyfra211;
    roc 'CEA' cea;
    roccontrast reference ('CEA') /estimate e;
    
run;



ods graphics off;
