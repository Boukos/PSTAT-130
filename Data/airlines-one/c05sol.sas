*Chapter 5, Exercise 1 Solution;

options ls=64 nodate pageno=1;
libname ia '.'; *PC and Unix;
*libname ia '.prog1.sasdata'; *TSO;
proc sort data=ia.passngrs out=work.passngrs;
   by Dest;
run;
proc print data=work.passngrs label;
   var Depart FClass BClass EClass;
   by Dest;
   pageby Dest;
   sum FClass BClass EClass;
   format Depart date9. FClass BClass EClass comma6.;
   label Dest='Destination'
         Depart='Departure Date'
         FClass='First Class'
         BClass='Business Class'
         EClass='Economy Class';
   title 'San Francisco Passenger Data';
run; 


*Chapter 5, Exercise 2 Solution; 

proc format;
   value $cities 'ANC'='Anchorage'
                 'HNL'='Honolulu'
                 'SEA'='Seattle';
run;

*Chapter 5, Exercise 3 Solution;

options pageno=1;
proc print data=work.passngrs label;
   var Depart FClass BClass EClass;
   by Dest;
   pageby Dest;
   sum FClass BClass EClass;
   format Depart date9. FClass BClass EClass comma6. 
          Dest $cities.;
   label Dest='Destination'
         Depart='Departure Date'
         FClass='First Class'
         BClass='Business Class'
         EClass='Economy Class';
   title 'San Francisco Passenger Data';
run;

*Chapter 5, Exercise 4 Solution;

options ls=64 nodate number pageno=1;
ods html file='c05ex04.html'; *PC and Unix;
*ods html file='.prog1.sascode(c05ex04)'; *TSO;
proc print data=work.passngrs label;
   var Depart FClass BClass EClass;
   by Dest;
   pageby Dest;
   sum FClass BClass EClass;
   format Depart date9. FClass BClass EClass comma6. 
          Dest $cities.;
   label Dest='Destination'
         Depart='Departure Date'
         FClass='First Class'
         BClass='Business Class'
         EClass='Economy Class';
   title 'San Francisco Passenger Data';
run;
ods html close;

*Chapter 5, Exercise 5 Solution;

*Part a;
 
proc format;
   value $gendfmt 'F'='Female'
                  'M'='Male';
run;

*Part b;  

options ls=72 nodate nonumber;
ods html file='c05ex05b.html';
proc print data=ia.newmechs;
   where JobCode='MECH01';
   var EmpID LastName FirstName Gender;
   title 'Level I Mechanics';
   format Gender $gendfmt.;
run;
ods html close;


