*Chapter 6, Exercise 1 Solution;

*Part a;

data work.sanfran;
   infile 'sfosch.dat'; *PC and Unix;
   *infile '.prog1.rawdata(sfosch)'; *TSO;
   input FlightID $ 1-7 RouteID $ 8-14
         Destination $ 18-20 Model $ 21-40
         DepartDay 51 TotPassCap 65-67;
run;

*Part c;
 
options nodate nonumber ls=72;
proc print data=work.sanfran;
run;

*Part d;       

proc contents data=work.sanfran;
run;

*Chapter 6, Exercise 2 Solution;

*Part a; 
 
data work.sanfran;
   infile 'sfosch.dat'; *PC and Unix;
   *infile '.prog1.rawdata(sfosch)'; *TSO;
   input @1 FlightID $7. @8 RouteID $7.
         @18 Destination $3. @21 Model $20.
         @41 Date date9. @65 TotPassCap 3.;
run;

*Part b; 
 
proc print data=work.sanfran label;
   format Date mmddyy10.;
   label FlightID='Flight ID'
         RouteID='Route ID'
         Model='Aircraft Model'
         Date='Departure Date'
         TotPassCap='Total Passenger Capacity';
run;
 
*Part c; 
 
proc contents data=work.sanfran;
run;

*Chapter 6, Exercise 3 Solution;

*Part a; 
 
data work.passngrs;
   infile 'sfosch.dat'; *PC and Unix;
   *infile '.prog1.rawdata(sfosch)'; *TSO;
   input @1 FlightID $7. @18 Destination $3. 
         @41 Date date9. @53 FClassPass 3.
         @57 BClassPass 3. @61 EClassPass 3.;
run;

*Part c; 

options ls=72 nodate nonumber;
proc print data=work.passngrs;
   format Date date9.;
run;
 
*Chapter 6, Exercise 4 Solution;

*Part a;
 
data work.sanfran;
   infile 'sfosch.dat'; *PC and Unix;
   *infile '.prog1.rawdata(sfosch)'; *TSO;
   input @1 FlightID $7. @8 RouteID $7.
         @18 Destination $3. @21 Model $20.
         @41 Date date9. @65 TotPassCap 3.;
run;
proc print data=work.sanfran label;
   format Date mmddyy10.;
   label FlightID='Flight ID'
         RouteID='Route ID'
         Model='Aircraft Model'
         Date='Departure Date'
         TotPassCap='Total Passenger Capacity';
run;
proc contents data=work.sanfran;
run;

*Part b; 

data work.sanfran;
   infile 'sfosch.dat'; *PC and Unix;
   *infile '.prog1.rawdata(sfosch)'; *TSO;
   input @1 FlightID $7. @8 RouteID $7.
         @18 Destination $3. @21 Model $20.
         @41 Date date9. @65 TotPassCap 3.;
   format Date mmddyy10.;
   label FlightID='Flight ID'
         RouteID='Route ID'
         Model='Aircraft Model'
         Date='Departure Date'
         TotPassCap='Total Passenger Capacity';
run;
proc print data=work.sanfran label;
run;
proc contents data=work.sanfran;
run;
 

*Chapter 6, Exercise 5 Solution;

*Part a3;   

libname ia '.'; *PC and Unix;
*libname ia '.prog1.sasdata'; *TSO;
proc contents data=ia.passngrs;
run;

*Part b;  
 
proc datasets library=ia;
   modify passngrs;
   format Depart date9.;
   label Depart='Departure Date';
run;
proc contents data=ia.passngrs;
run;
