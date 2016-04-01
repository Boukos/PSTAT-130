data europe;
   length SalesID $ 4 Location $ 3;
   infile 'sales.dat'; * PC and Unix;
   *infile '.prog2.rawdata(sales)'; * z/OS;
   input SalesID $ Location $ @;
   if Location='EUR';
   input SaleDate : date9. Amount : commax8.;
run;

proc print data=europe noobs;
   title' European Sales Figures';
run;