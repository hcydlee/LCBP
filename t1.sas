libname dwy "C:\Users\sli126\Documents\GitHub\LCBP";

ods graphics on;
ods html;
proc logistic data=dwy.ad1 plots=roc(id=prob);
	model cancer_b(event='1')=age sexc smokec slobec diasumm pro_grp scc cyfra211 cea /nofit;
	roc 'Pro_GRP' pro_grp;
	roc 'SCC' scc;
	roc 'CYFRA211' cyfra211;
	roc 'CEA' cea;
	roccontrast reference ('CEA') /estimate e;
	
run;


ods html close;
ods graphics off;


ods graphics on;

proc logistic data=dwy.ad1 plots=roc(id=prob);
	model nsclc(event='1')=age sexc smokec slobec diasumm pro_grp scc cyfra211 cea;
	roc 'Pro_GRP' pro_grp;
	roc 'SCC' scc;
	roc 'CYFRA211' cyfra211;
	roc 'CEA' cea;
	roccontrast reference ('CEA') /estimate e;
	
run;


ods graphics off;


ods graphics on;

proc logistic data=dwy.ad1 plots=roc(id=prob);
	model sclc(event='1')=age sexc smokec slobec diasumm pro_grp scc cyfra211 cea;
	roc 'Pro_GRP' pro_grp;
	roc 'SCC' scc;
	roc 'CYFRA211' cyfra211;
	roc 'CEA' cea;
	roccontrast reference ('CEA') /estimate e;
	
run;



ods graphics off;

ods graphics on;

proc logistic data=dwy.ad1 plots=roc(id=prob);
	model cancer_a(event='1')=age sexc smokec slobec diasumm pro_grp scc cyfra211 cea ;
	exact slobec/estimate=both;
	roc 'Pro_GRP' pro_grp;
	roc 'SCC' scc;
	roc 'CYFRA211' cyfra211;
	roc 'CEA' cea;
	roccontrast reference ('CEA') /estimate e;
	
run;



ods graphics off;
