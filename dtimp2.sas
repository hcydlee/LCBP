libname dwy "&path\DavidY\LCBP";
data dwy.rawdsn                                     ;
    %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
    infile "&path\DavidY\LCBP\lcbpdt20141229.csv" delimiter = ',' MISSOVER DSD lrecl=3276
 firstobs=2 ;
       informat ID best32. ;
       informat result $8. ;
       informat stage $9. ;
       informat center best32. ;
       informat Pro_GRP best32. ;
       informat SCC best32. ;
       informat CYFRA211 best32. ;
       informat CEA best32. ;
       informat ALT best32. ;
       informat CrEnz best32. ;
       informat age best32. ;
       informat sex $1. ;
       informat smoke $1. ;
       informat fmh $1. ;
       informat slobe $1. ;
       informat diasumm best32. ;
       informat DESS best32. ;
       informat spiculation best32. ;
       informat ch best32. ;
       informat diasumim best32. ;
       format ID best12. ;
       format result $8. ;
       format stage $9. ;
       format center best12. ;
       format Pro_GRP best12. ;
       format SCC best12. ;
       format CYFRA211 best12. ;
       format CEA best12. ;
       format ALT best12. ;
       format CrEnz best12. ;
       format age best12. ;
       format sex $1. ;
       format smoke $1. ;
       format fmh $1. ;
       format slobe $1. ;
       format diasumm best12. ;
       format DESS best12. ;
       format spiculation best12. ;
       format ch best12. ;
       format diasumim best12. ;
       input
                ID
                result $
                stage $
                center
                Pro_GRP
                SCC
                CYFRA211
                CEA
                ALT
                CrEnz
                age
                sex $
                smoke $
                fmh $
                slobe $
                diasumm
                DESS
                spiculation
                ch
                diasumim
;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;

