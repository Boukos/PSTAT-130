*Chapter 8, Exercise 1 Solution;

*Part b; 
 
data work.q2vienna;
  set ia.aprtarget(rename=(Flight=FlightID 
                           FClassTar=FTarget 
                           EClassTar=ETarget)) 
      ia.maytarget ia.juntarget;
run;

*Part d;
 
proc print data=work.q2vienna;
run;
 
*Part e; 
 
data work.q2vienna;
   keep FlightID Destination Date TotTar TotRev;
   set ia.aprtarget(rename=(Flight=FlightID 
                            FClassTar=FTarget 
                            EClassTar=ETarget)) 
       ia.maytarget ia.juntarget;
   TotTar=sum(FTarget,ETarget);
   TotRev=sum(FRev,ERev);
run;

*Part f; 
 
proc print data=work.q2vienna;
run;


*Chapter 8, Exercise 2 Solution;

proc sort data=ia.target121999 out=sortb;
   by FlightID;
   where Date='15dec1999'd and Origin='BHM';
run;
proc sort data=ia.sales121999 out=sorts;
   by FlightID;
   where Date='15dec1999'd and Origin='BHM';
run;
data compare;
   merge sortb sorts;
   by FlightID;
   LostCargoRev=CargoTarRev-CargoRev;
run;
proc print data=compare label;
   format LostCargoRev dollar12.2;
   var CargoTarRev CargoRev LostCargoRev;
   label LostCargoRev='Lost Cargo Revenue';
run;
 

*Chapter 8, Exercise 3 Solution;

*Part a; 
 
proc sort data=ia.pilots out=pilots;
   by IDNum;
run;
proc sort data=ia.frankfrt out=frankfrt;
   by IDNo;
run;
data schedule; 
   keep IDNum LName FName Date Flight;
   merge pilots frankfrt(rename=(IDNo=IDNum));
   by IDNum;
run;
proc print data=schedule;
run;

*Part b; 
 
data schedule; 
   keep IDNum LName FName Date Flight; 
   merge pilots frankfrt(in=inFrank rename=(IDNo=IDNum));
   by IDNum; 
   if inFrank=1; 
run; 
proc print data=schedule; 
run;

*Part c; 
 
data nofrank;
   keep IDNum LName FName; 
   merge pilots frankfrt(in=inFrank rename=(IDNo=IDNum));
   by IDNum;  
   if inFrank=0;
run; 
proc print data=nofrank; 
run;
