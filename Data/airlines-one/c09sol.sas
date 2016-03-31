*Chapter 9, Exercise 1 Solution;

*Part a; 

proc freq data=ia.sanfran;
   tables DepartDay;
   title 'Flights from San Francisco by Day of Week';
run;

*Part b;

proc freq data=ia.sanfran;
   tables Destination;
   title 'Flights from San Francisco';
run;

*Part c;

proc freq data=ia.sanfran;
   tables Destination / nocum;
run;

*Part d;

proc freq data=ia.sanfran;
   tables Destination*DepartDay;
run;


*Chapter 9, Exercise 2 Solution;

*Part a; 
 
proc freq data=ia.mechanics;
   tables Gender JobCode;
run;

*Part b;

proc freq data=ia.mechanics;
   tables Gender*JobCode;
run;


*Chapter 9, Exercise 3 Solution;

*Part a;

title;
proc means data=ia.sanfran;
   var CargoRev TotPassCap;
run;

*Part b;

proc means data=ia.sanfran maxdec=2;
   var CargoRev TotPassCap;
   class Destination;
run;


*Chapter 9, Exercise 4 Solution;

proc means data=ia.sanfran min max mean maxdec=2;
   var CargoRev TotPassCap;
   class Destination;
run;

*Chapter 9, Exercise 5 Solution;

ods html file='means.html'; *PC and Unix;
*ods html file='.prog1.sascode(means)'; *TSO;
proc means data=ia.sanfran min max mean maxdec=2;
   var CargoRev TotPassCap;
   class Destination;
run;
ods html close;

 
*Chapter 9, Exercise 6 Solution;

title 'Employee Salary Data';
proc report data=ia.employees nowd;
   column Division City Salary;
   define Division / order width=20 'Division Name';
   define City /  width=13 'City Based';
   define Salary / format=dollar14.;
run;

*Chapter 9, Exercise 7 Solution;

proc report data=ia.employees nowd;
   column Division City Salary;
   define Division / order width=20 'Division Name';
   define City / order width=13 'City Based';
   define Salary / format=dollar14.;
run;


*Chapter 9, Exercise 8 Solution;

title 'Employee Salary Data by Division / City';
proc report data=ia.employees nowd;
   column Division City Salary;
   define Division / group width=20 'Division Name';
   define City / group width=13 'City Based';
   define Salary / format=dollar14.;
run;

*Chapter 9, Exercise 9 Solution;

title 'Employee Salary Data by Division / City';
proc report data=ia.employees nowd;
   column Division City Salary;
   define Division / group width=20 'Division Name';
   define City / group width=13 'City Based';
   define Salary / format=dollar14.;
   rbreak after / summarize ol dul;
run;


*Chapter 9, Exercise 10 Solution;

title 'Counts by Division';
proc tabulate data=ia.employees;
   class Division;
   table Division;
run;

*Chapter 9, Exercise 11 Solution;

title 'Counts for Operations Divisions';
proc tabulate data=ia.employees;
   where Division contains 'OPERATIONS';
   class Division City;
   table City all, Division all;
run;

*Chapter 9, Exercise 12 Solution;

title 'Average Salaries for Operations Divisions';
proc tabulate data=ia.employees format=dollar10.;
   where Division contains 'OPERATIONS';
   class Division City;
   var Salary;
   table City all, Division*Salary*mean all*Salary*mean;
run;

*Chapter 9, Exercise 13 Solution;

ods html file='tabulate.html'; *PC and Unix;
*ods html file='.prog1.sascode(tabulate)'; *TSO;
proc tabulate data=ia.employees format=dollar10.;
   where Division contains 'OPERATIONS';
   class Division City;
   var Salary;
   table City all, Division*Salary*mean all*Salary*mean;
run;
ods html close;
