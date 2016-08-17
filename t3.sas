
libname dwy "C:\sli126\GitHub\LCBP"; /*"C:\sli126\Documents\ydw\LCBP"*/

  proc sql noprint;
    select count(cancer_b) into :bign from dwy.ad2
    ;
quit;
%put bign is  &bign;

ods graphics on;

proc logistic data=dwy.ad2 plots=roc;
    model cancer_b1(event='1')=age smokec  diasumm spiculation  sexc pro_grp scc cyfra211 cea/ ctable ;
    roc 'Pro_GRP' pro_grp;
    roc 'SCC' scc;
    roc 'CYFRA211' cyfra211;
    roc 'CEA' cea;
    roccontrast reference ('CEA') /estimate e;
    output out=b1 p=estp;
run;


ods graphics off;


ods graphics on;

proc logistic data=dwy.ad2 plots=roc;
    model nsclc(event='1')=age sexc smokec slobec diasumm pro_grp scc cyfra211 cea;
    roc 'Pro_GRP' pro_grp;
    roc 'SCC' scc;
    roc 'CYFRA211' cyfra211;
    roc 'CEA' cea;
    roccontrast reference ('CEA') /estimate e;
    
run;


ods graphics off;


ods graphics on;

proc logistic data=dwy.ad2 plots=roc;
    model sclc(event='1')=age sexc smokec slobec diasumm pro_grp scc cyfra211 cea;
    roc 'Pro_GRP' pro_grp;
    roc 'SCC' scc;
    roc 'CYFRA211' cyfra211;
    roc 'CEA' cea;
    roccontrast reference ('CEA') /estimate e;
    
run;



ods graphics off;

ods graphics on;

proc logistic data=dwy.ad2 plots=roc;
    model cancer_a1(event='1')=age smokec  ch sexc   pro_grp scc cyfra211 cea ;
    roc 'Pro_GRP' pro_grp;
    roc 'SCC' scc;
    roc 'CYFRA211' cyfra211;
    roc 'CEA' cea;
    roccontrast reference ('CEA') /estimate e;
        output out=b2 p=estp;
run;



ods graphics off;
