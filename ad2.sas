libname dwy "&path\DavidY\LCBP";

data ad1;
    set dwy.rawdsn;
    length crenzc $8;
    where result not in ('ERROR');

    if fmh='NA' then call missing(fmh);
    if slobe='NA' then call missing(slobe);
    if smoke='NA' then call missing(smoke);

    /*CT results categary*/
    if result ne 'UNBIOPSY' then CTCAT='MAL';else CTCAT='BEN';

    /*if there is a biopsy, show cancer or non-cancer results, SCLC, NSCLC*/
    if CTCAT='MAL' then do;
        if result='NON' then  cancer_b=0; else if  result not in ('FAIL' 'ERROR' 'NON') then cancer_b=1;

        if result='SCLC' then sclc=1; else sclc=0;

        if result in ('NSCLC' 'ADK' 'SQ' 'ADK+SQ' 'LCLC') then nsclc=1 ;else nsclc=0;

    end;
/*Overall results, CT show no need biopsy and biopsy show not cancer as no cancer. biopsy show cancer as cancer*/
    if result='UNBIOPSY' or cancer_b=0 then cancer_a=0; else if cancer_b=1 then cancer_a=1;
    
/*ALT and CrENz abnormal*/
     if alt>55 then altc='ABNORMAL';else  if 0<=alt<=55 then altc='NORMAL'; 

     if sex='M' then do;
        if 64<=crenz<=104 then crenzc='NORMAL'; else crenzc='ABNORMAL';
     end;
     else if sex='F' then do;
        if 49<=crenz<=90 then crenzc='NORMAL'; else crenzc='ABNORMAL';
     end;

     if sex='M' then sexc=1;else if sex='F' then sexc=0;

     if smoke='N' then smokec=0 ;else if smoke='Y' then smokec=1;
     if slobe='N' then slobec=0 ;else if slobe='Y' then slobec=1;
    
     if center in (1,5) then vdtfl1='Y';
     x=rand('UNIFORM');
     if x<0.4 then vdtfl2='Y';


     cancer_a1=cancer_a;
     cancer_b1=cancer_b;
     if vdtfl1='Y' then do;
        va1=cancer_a;
        vb1=cancer_b;
        call missing(cancer_a1,cancer_b1);
     end;

     cancer_a2=cancer_a;
     cancer_b2=cancer_b;
     if vdtfl2='Y' then do;
        va2=cancer_a;
        vb2=cancer_b;
        call missing(cancer_a2,cancer_b2);
     end;
run;
   


data dwy.ad2;
    set ad1;
    if not missing(id) and lc ne -1;
run;
proc freq data=dwy.ad2;
    table vdtfl2;
run;
