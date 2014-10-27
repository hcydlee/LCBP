libname dwy "C:\Users\sli126\Documents\GitHub\LCBP";

data ad1;
	set dwy.ad;
	length crenzc $8;
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
	
	
run;

data dwy.ad1;
	set ad1;
run;
