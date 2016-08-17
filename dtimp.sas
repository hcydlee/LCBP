libname dwy "&path\DavidY\LCBP";
     data DWY.DT                                       ;
     %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
     infile "&path\DavidY\LCBP\lcbpdt20141229.csv" delimiter = ',' MISSOVER DSD
 lrecl=32767 firstobs=2 ;
        informat ID best32. ;
        informat result $8. ;
        informat stage $9. ;
        informat center best32. ;
        informat Pro_GRP best12. ;
        informat SCC best7. ;
        informat CYFRA211 best32. ;
        informat CEA best12. ;
        informat ALT best8. ;
        informat CrEnz best12. ;
        format ID best12. ;
        format result $8. ;
        format stage $9. ;
        format center best12. ;
        format Pro_GRP best12. ;
        format SCC best7. ;
        format CYFRA211 best12. ;
        format CEA best12. ;
        format ALT best8. ;
        format CrEnz best12. ;
     input
                 ID
                 result $
                 stage $
                 center
                 Pro_GRP $
                 SCC $
                 CYFRA211
                 CEA $
                 ALT $
                 CrEnz $
     ;
     if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
     run;


          data dwy.DT2                                     ;
     %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
     infile 'D:\DavidY\LCBP\LCBP DESS for LSC 20141026.csv' delimiter = ',' MISSOVER DSD
 lrecl=32767 firstobs=2 ;
        informat id best32. ;
        informat age best32. ;
        informat sex $1. ;
        informat smoke $1. ;
        informat fmh $3. ;
        informat slobe $3. ;
        informat diasumm best32. ;
        informat DESS best32. ;
        format id best12. ;
        format age best12. ;
        format sex $1. ;
        format smoke $1. ;
        format fmh $3. ;
        format slobe $3. ;
        format diasumm best12. ;
        format DESS best12. ;
     input
                 id
                 age
                 sex $
                 smoke $
                 fmh $
                 slobe $
                 diasumm
                 DESS
     ;
     if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
     run;


     proc sql noprint;
        create table dwy.ad as 
        select a.*,b.age,b.sex,b.smoke, b.fmh,b.slobe,b.diasumm,b.dess from
        dwy.dt a left join dwy.dt2 b
        on a.id=b.id;
    quit;
