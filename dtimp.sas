libname dwy "D:\DavidY\LCBP";
PROC IMPORT OUT= dwy.dt 
            DATAFILE= "D:\DavidY\LCBP\LCBP data for lsc 20141024.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
     GUESSINGROWS=600; 
RUN;
