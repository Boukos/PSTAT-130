   /*List input*/

data airplanes;
   length ID $ 5;
   infile 'aircraft1.dat';
   input ID $ InService : date9. PassCap CargoCap;
run;

proc print data=airplanes noobs;
   title 'Raw Data with One Non-standard Field, Blank as Delimiter'; 
run;

   /*Non-blank delimiter*/

data airplanes2;
   length ID $ 5;
   infile 'aircraft2.dat' dlm=',';
   input ID $ InService :date9. PassCap CargoCap;
run;

proc print data=airplanes2 noobs;
   title 'Comma-Delimited Raw Data'; 
run;

   /*Missover option*/

data airplanes3;
   length ID $ 5;
   infile 'aircraft3.dat' dlm=',' missover;
   input ID $ InService :date9. PassCap CargoCap;
run;

proc print data=airplanes3 noobs;
   title 'Records with Missing Data at End'; 
run;

   /*DSD option*/

data airplanes4;
   length ID $ 5;
   infile 'aircraft4.dat' dsd;
   input ID $ InService :date9. PassCap CargoCap;
run;

proc print data=airplanes4 noobs;
   title 'Records with Missing Data -- No Placeholder'; 
run;