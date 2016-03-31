*Chapter 7, Exercise 1 Solution; 

*Part a;

data bonus;
   set ia.fltattnd;
   keep EmpID Salary BonusAmt HireDate AnnivMo;
   BonusAmt=.08*Salary;
   AnnivMo=month(HireDate);
run;

*Part b;
 
proc print data=bonus;
   format Salary BonusAmt dollar8.0 ;
run;

   
*Chapter 7, Exercise 2 Solution;

*Part a;
 
data raises;
   set ia.fltattnd;
   keep EmpID Salary Increase NewSal;
   if JobCode='FLTAT1' then Increase=.10*Salary;
   else if JobCode='FLTAT2' then Increase=.08*Salary;
   else if JobCode='FLTAT3' then Increase=.06*Salary;
   NewSal=sum(Salary,Increase);
run;

*Part b;	
 
proc print data=raises;
   format Salary Increase NewSal dollar8.0 ;
run;
   

*Chapter 7, Exercise 3 Solution;

*Part a;	

data raises;
   set ia.fltattnd;
   keep EmpID Salary Increase NewSal BonusAmt;
   if JobCode='FLTAT1' then do;
      Increase=.10*Salary;
      BonusAmt=.15*Salary;
   end;
   else if JobCode='FLTAT2' then do;
      Increase=.08*Salary;
      BonusAmt=.12*Salary;
   end;
   else if JobCode='FLTAT3' then do;
      Increase=.06*Salary;
      BonusAmt=.10*Salary;
   end;
   if BonusAmt gt 2000;
   NewSal=sum(Salary,Increase);
run;

*Part b;	
 
proc print data=raises;
   format Salary Increase NewSal BonusAmt dollar8.0 ;
run;
 
*Chapter 7, Exercise 4 Solution;

*Part a; 	

data raises;
   set ia.fltattnd;
   keep EmpID Salary Increase NewSal BonusAmt JobTitle;
   length JobTitle $ 23;
   if JobCode='FLTAT1' then do;
      Increase=.10*Salary;
      BonusAmt=.15*Salary;
      Jobtitle='Flight Attendant I';
   end;
   else if JobCode='FLTAT2' then do;
      Increase=.08*Salary;
      BonusAmt=.12*Salary;
      Jobtitle='Flight Attendant II';
   end;
   else if JobCode='FLTAT3' then do;
      Increase=.06*Salary;
      BonusAmt=.10*Salary;
      Jobtitle='Senior Flight Attendant';
   end;
   if BonusAmt gt 2000;
   NewSal=sum(Salary,Increase);
run;


*Part b;  
 
proc print data=raises;
   format Salary Increase NewSal BonusAmt dollar8.0 ;
run;


*Chapter 7, Exercise 5 Solution;

*Part a; 
 
data bonus(keep=EmpID Salary BonusAmt HireDate AnnivMo);
   set ia.fltattnd;
   BonusAmt=.08*Salary;
   AnnivMo=month(HireDate);
run; 

*Part b;
 
proc print data=bonus;
   format Salary BonusAmt dollar8.0 ;
run;
 

*Chapter 7, Exercise 6 Solution;

*Part a; 
 
proc import out=work.sfodatetime 
            datafile='sfoschdates.xls' 
            dbms=excel2000;
   getnames=yes;
run; 

*Part b;  

data work.sfoexcel;
   set work.sfodatetime(rename=(Date=OldDate));
   drop OldDate;
   Date=datepart(OldDate); 
   format Date date9.; 
run;

*Part c;  

options ls=72 nodate nonumber;
proc print data=work.sfoexcel;
run;
